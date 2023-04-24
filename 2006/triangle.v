module triangle (clk, reset, nt, xi, yi, busy, po, xo, yo);
  input clk, reset, nt;
  input [2:0] xi, yi;
  output reg busy, po;
  output reg [2:0] xo, yo;
  
reg [1:0] cur_state, next_state;

// state
parameter IDLE = 2'd0;
parameter READ = 2'd1;
parameter WRITE = 2'd2;


reg [3:0] datain_x[0:2];
reg [3:0] datain_y[0:2];
reg [3:0] dataout_x;
reg [3:0] dataout_y;
reg [1:0] cnt;
reg [3:0] x, y;
reg [7:0] isleft;

always@(posedge clk or posedge reset)
begin
    if(reset) cur_state <= IDLE;
    else  cur_state <= next_state;
end

always@(*)
begin
    case(cur_state)
    IDLE:
    begin
        if(nt)
         next_state = READ;
        else
         next_state = IDLE;
    end
    READ:
    begin
        if(cnt == 2'd2)
         next_state = WRITE;
        else
         next_state = READ; 
    end
    WRITE:
    begin
        if(xo == datain_x[2][2:0] && yo == datain_y[2][2:0])
         next_state = IDLE;
        else
         next_state = WRITE;
    end
    endcase
end

// cnt
always@(posedge clk or posedge reset)
begin
    if(reset)
     cnt <= 2'd0;
    else if(cur_state == READ && cnt == 2'd2)
     cnt <= 2'd0;
    else
     cnt <= cnt + 2'd1;
end


// xo yo x y 
always@(posedge clk or posedge reset)
begin
    if(reset)
    begin
        x <= 4'd0;
        y <= 4'd0;
        dataout_x <= 4'd0;
        dataout_y <= 4'd0;
    end
    else
    begin
        case(cur_state)
        READ:
        begin
            datain_x[cnt] <= {1'd0,xi};
            datain_y[cnt] <= {1'd0,yi};
        end
        WRITE:
        begin
            isleft <= (datain_x[1]-dataout_x)*(datain_y[2]-datain_y[1])-(dataout_y-datain_y[1])*(datain_x[1]-datain_x[2]);
            if(datain_x[1] > datain_x[0])
            begin
                dataout_x <= datain_x[0] + x;
                dataout_y <= datain_y[0] + y;
                if(isleft[7])
                begin
                    x <= 4'd0;
                    y <= y + 4'd1;
                end
                else
                begin
                    x <= x + 4'd1;
                    y <= y;
                end
            end
            else if(datain_x[1] < datain_x[0])
            begin
                dataout_x <= datain_x[1] + x;
                dataout_y <= datain_y[1] + y;
                if(dataout_x == datain_x[0])
                begin
                    x <= 4'd0;
                    y <= y + 4'd1;
                end
                else
                begin
                    x <= x + 4'd1;
                    y <= y;
                end
            end
        end
        endcase
    end
end

always@(posedge clk)
begin
    if(cur_state == WRITE)
    begin
        xo <= dataout_x[2:0];
        yo <= dataout_y[2:0];
    end
end

// po
always@(posedge clk or posedge reset)
begin
    if(reset)
     po <= 1'b0;
    else 
    begin
        case(cur_state)
        WRITE:
        begin
            if(datain_x[1] > datain_x[0] && isleft[7] == 1'b1)
             po <= 1'b0;
            else if(datain_x[1] < datain_x[0] && isleft[7] == 1'b0)
             po <= 1'b0;
            else
             po <= 1'b1;
        end
        default:
        begin
            po <= 1'b0;
        end
        endcase
    end
end

// busy
always@(posedge clk or posedge reset)
begin
    if(reset)
     busy <= 1'b0;
    else if(cur_state == WRITE && xo == datain_x[2][2:0] && yo == datain_y[2][2:0])
     busy <= 1'b0;
    else if(cur_state == WRITE)
     busy <= 1'b1;
end
endmodule

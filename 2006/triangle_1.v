module triangle (clk, reset, nt, xi, yi, busy, po, xo, yo);
   input clk, reset, nt;
   input [2:0] xi, yi;
   output reg busy, po;
   output reg [2:0] xo, yo;
  
reg [2:0] cur_state, next_state;
parameter READ_1 = 3'd0;
parameter READ_2 = 3'd1;
parameter READ_3 = 3'd2;
parameter WRITE = 3'd3;

reg [3:0] now_x, now_y;
reg [3:0] x1, x2, x3, y1, y2, y3;


always@(posedge clk or posedge reset)
begin
    if(reset) cur_state <= READ_1;
    else  cur_state <= next_state;
end

always@(*)
begin
    case(cur_state)
    READ_1:
    begin
        if(nt)
         next_state = READ_2;
        else
         next_state = READ_1;
    end
    READ_2:
    begin
         next_state = READ_3;
    end
    READ_3:
    begin
         next_state = WRITE;
    end
    WRITE:
    begin
        if(now_x == x3 + 4'd1 && now_y == y3)
         next_state = READ_1;
        else
         next_state = WRITE;
    end
	 default:
	 begin
		next_state = READ_1;
	 end
    endcase
end

always@(posedge clk or posedge reset)
begin
    if(reset)
    begin
        xo <= 3'd0;
        yo <= 3'd0;
        busy <= 1'b0;
        po <= 1'b0;
    end
    else
    begin
        case(cur_state)
        READ_1:
        begin
            if(nt)
            begin
                busy <= 1'b1;
                x1 <= xi;
                y1 <= yi;
            end
        end
        READ_2:
        begin
            x2 <= xi;
            y2 <= yi; 
        end
        READ_3:
        begin
            x3 <= xi;
            y3 <= yi; 
            now_x <= x1;
            now_y <= y1;
        end
        WRITE:
        begin
        
                
                if(now_x < x2 && now_y == y1)
                begin
                    po <= 1'b1;
                    xo <= now_x;
                    yo <= now_y;
                    now_x <= now_x + 4'd1;
                end
                else if(now_x == x3 && now_y < y3)
                begin
                    po <= 1'b1;
                    xo <= now_x;
                    yo <= now_y;
                    now_x <= now_x + 4'd1;
                end
                else if((x2-now_x)*(y3-y2) >= (now_y-y2)*(x2-x3) && now_x <= x2 && now_y <= y3)
                begin
                    po <= 1'b1;
                    xo <= now_x;
                    yo <= now_y;
                    now_x <= now_x + 4'd1;
                end
                else
                begin
                    po <= 1'b0;
                    now_y <= now_y + 4'd1;
                    now_x <= x1;
                end

                if(now_x == x3 + 4'd1 && now_y == y3)
                begin
                    busy <= 1'b0;
                    po <= 1'b0;
                end
            
        end
        endcase
    end
end

endmodule
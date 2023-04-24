module lcd_ctrl(clk, reset, datain, cmd, cmd_valid, dataout, output_valid, busy);
input           clk;
input           reset;
input   [7:0]   datain;
input   [2:0]   cmd;
input           cmd_valid;
output reg [7:0]   dataout;
output reg         output_valid;
output reg         busy;

parameter WAIT = 1'b0;
parameter PROC = 1'b1;

parameter REFLASH = 3'd0;
parameter LOAD = 3'd1;
parameter RIGHT = 3'd2;
parameter LEFT = 3'd3;
parameter UP = 3'd4;
parameter DOWN = 3'd5;

reg next, cur;
reg[2:0] cmdreg;
reg[7:0] data[0:35]; //input
reg[5:0] cnt, outpos;
reg[2:0] col,row;
reg [2:0] row_t;
reg [2:0] col_t;

// next state logic
always @(*)
begin
    case(cur)
        WAIT:
        begin
            if(cmd_valid)next = PROC;
            else next = WAIT;
        end
        PROC:
        begin
            if(cmdreg == REFLASH && cnt[2:0] == 3'd2 && cnt[5:3] == 3'd2) next = WAIT;
            else next = PROC;
        end
    endcase
end

// state register
always @(posedge clk or posedge reset)
begin
    if(reset) cur <= WAIT;
    else cur <= next;
end

// data pass
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        cnt <= 6'd0;
        col <= 3'd2;
        row <= 3'd2;
        busy <= 1'b0;
        output_valid <= 1'b0;
        dataout <= 8'd0;
        cmdreg <= REFLASH;
    end
    else 
    begin
        case(cur)
        WAIT:
        begin
            if(cmd_valid)
            begin
                cmdreg <= cmd;
                busy <= 1'b1;
            end
            cnt <= 6'd0;
            output_valid <= 1'b0;
        end
        PROC:
        begin
            case(cmdreg)
            REFLASH:
            begin
                if(cnt[5:3]==3'd2 && cnt[2:0] ==3'd2) busy <= 1'b0;
                if(cnt[2:0] == 3'd2)
                begin
                    cnt[2:0] <= 3'd0;
                    cnt[5:3] <= cnt[5:3]+3'd1;
                end
                else
                begin
                    cnt <= cnt + 6'd1;
                end
                dataout <= data[outpos];
                output_valid <= 1'b1;
            end
            LOAD:
            begin
                if(cnt==6'd35)
                begin
                    cmdreg <= REFLASH;
                    cnt <= 6'd0;
                end
                else
                begin
                    cnt <= cnt+6'd1;
                end
                data[cnt] <= datain;
                col <=3'd2;
                row <=3'd2;
            end
            RIGHT:
            begin
                if(col>=3)
                begin
                    col <= col;
                end
                else 
                begin
                    col <= col+3'd1;
                end
                cmdreg <= REFLASH;
            end
            LEFT:
            begin
                if(col<=0)
                begin
                    col <= col;
                end
                else 
                begin
                    col <= col-3'd1;
                end
                cmdreg <= REFLASH;
            end
            DOWN:
            begin
                if(row>=3)
                begin
                    row <= row;
                end
                else 
                begin
                    row <= row+3'd1;
                end
                cmdreg <= REFLASH;
            end
            UP:
            begin
                if(row<=0)
                begin
                    row <= row;
                end
                else 
                begin
                    row <= row-3'd1;
                end
                cmdreg <= REFLASH;
            end
            endcase
        end
        endcase
    end
end

// output logic
always @(*)
begin
    row_t = row + cnt[5:3];
    col_t = col + cnt[2:0];
    outpos = (row_t<<2) + (row_t<< 1) + col_t;
end                                                     
endmodule
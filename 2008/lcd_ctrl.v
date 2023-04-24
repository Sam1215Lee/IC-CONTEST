module LCD_CTRL(clk, reset, datain, cmd, cmd_valid, dataout, output_valid, busy);
input           clk;
input           reset;
input   [7:0]   datain;
input   [2:0]   cmd;
input           cmd_valid;
output reg [7:0]   dataout;
output reg         output_valid;
output reg         busy;

reg [2:0] cmd_reg;
reg [7:0] img_counter;
reg [3:0] L;
reg [3:0] W;
reg [7:0] img_buff[0:107];
reg mode;

//mode
parameter zoom_fit = 1'b0,
          zoom_in = 1'b1;

reg cur_state;
reg next_state;

//state
parameter WAIT_CMD = 1'b0,
          PROCESS = 1'b1;

//cmd
parameter Load_Data = 3'd0,
          Zoom_in = 3'd1,
          Zoom_fit = 3'd2,
          Shift_Right = 3'd3,
          Shift_Left = 3'd4,
          Shift_Up = 3'd5,
          Shift_Down = 3'd6,
          Reflash = 3'd7;

// output position
reg [3:0] L_t;
reg [3:0] W_t;
reg [7:0] out_pos;

//next-state logic
always@(*)
begin
    case(cur_state)
    WAIT_CMD:
    begin
        if(cmd_valid)
        begin
            next_state = PROCESS;
        end
        else
        begin
            next_state = WAIT_CMD;
        end
    end
    PROCESS:
    begin
        if((cmd_reg == Reflash) && img_counter[7:4] == 4'd3 && img_counter[3:0] == 4'd3)
        begin
            next_state = WAIT_CMD;
        end
        else
        begin
            next_state = PROCESS;
        end
    end
    endcase
end

//  state regiister
always@(posedge clk or posedge reset)
begin
    if(reset)
     cur_state <= WAIT_CMD;
    else
     cur_state <= next_state;
end

//  output logic
always@(*)
begin
    if(mode == zoom_fit)
    begin
        out_pos = ((img_counter[7:4] << 4) + (img_counter[7:4] << 3)) + ((img_counter[3:0] << 2) - (img_counter[3:0]) + 8'd13);
    end
    else
    begin
        L_t = L + img_counter[3:0] - 4'd2;
        W_t = W + img_counter[7:4] - 4'd2;
        out_pos = (W_t << 3) + (W_t << 2) + L_t;
    end
end

//  datapath
always@(posedge clk or posedge reset)
begin
    if(reset)
    begin
        busy <= 1'b0;
        cmd_reg <= Reflash;
        L <= 4'd6;
        W <= 4'd5;
        dataout <= 8'd0;
        output_valid <= 1'b0;
        img_counter <= 8'b0;
    end
    else
    begin
        case(cur_state)
        WAIT_CMD:
        begin
            if(cmd_valid)
            begin
                cmd_reg <= cmd;
                busy <= 1'b1;
            end
            img_counter <= 8'd0;
            output_valid <= 1'b0;
        end
        PROCESS:
        begin
            case(cmd_reg)
            Reflash:
            begin
                dataout <= img_buff[out_pos];

                if(img_counter[3:0] == 4'd3)
                begin
                    img_counter[3:0] <= 4'd0;
                    img_counter[7:4] <= img_counter[7:4] + 4'd1;
                end
                else
                begin
                    img_counter <= img_counter + 8'd1;
                end

                if(img_counter[7:4] == 4'd3 && img_counter[3:0] == 4'd3)
                begin
                    busy <= 1'b0;
                end

                output_valid <= 1'b1;
            end
            Load_Data:
            begin
                if(img_counter == 8'd107)
                begin
                    cmd_reg <= Reflash;
                    mode <= zoom_fit;
                    img_counter <= 8'd0;
                end
                else
                begin
                    img_counter <= img_counter + 8'd1;
                end
                img_buff[img_counter] <= datain;
            end
            Zoom_in:
            begin
                if(mode == zoom_fit)
                begin
                    mode <= zoom_in;
                    L <= 4'd6;
                    W <= 4'd5;
                end
                cmd_reg <= Reflash;
            end
            Zoom_fit:
            begin
                if(mode == zoom_in)
                begin
                    mode <= zoom_fit;
                end
                cmd_reg <= Reflash;
            end
            Shift_Right:
            begin
                if(L >= 4'd10)
                begin
                    L <= L;
                end
                else
                begin
                    L <= L + 4'd1;
                end
                cmd_reg <= Reflash; 
            end
            Shift_Left:
            begin
                if(L <= 4'd2)
                begin
                    L <= L;
                end
                else
                begin
                    L <= L - 4'd1;
                end
                cmd_reg <= Reflash;
            end
            Shift_Up:
            begin
                if(W <= 4'd2)
                begin
                    W <= W;
                end
                else
                begin
                    W <= W - 4'd1;
                end
                cmd_reg <= Reflash;
            end
            Shift_Down:
            begin
                if(W >= 4'd7)
                begin
                    W <= W;
                end
                else
                begin
                    W <= W + 4'd1;
                end
                cmd_reg <= Reflash;
            end
            endcase
        end
        endcase
    end
end

endmodule

`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input       clk;
input       reset;
output  reg [13:0]  gray_addr;
output  reg         gray_req;
input       gray_ready;
input   [7:0]   gray_data;
output  reg [13:0]  lbp_addr;
output  reg lbp_valid;
output  reg [7:0]   lbp_data;
output  reg finish;


//====================================================================
reg [2:0] cur_state;
reg [2:0] next_state;

reg [7:0] gc_data;
reg [6:0] row;
reg [6:0] col;
reg [3:0] counter;
reg [13:0] gc_addr;

wire [6:0] col_l, col_r, row_u, row_d;
assign col_l = col - 7'd1;
assign col_r = col + 7'd1;
assign row_u = row - 7'd1;
assign row_d = row + 7'd1;

wire [13:0] g0_addr, g1_addr, g2_addr, g3_addr, g4_addr, g5_addr, g6_addr, g7_addr;
assign g0_addr = {row_u, col_l};
assign g1_addr = {row_u, col};
assign g2_addr = {row_u, col_r};
assign g3_addr = {row, col_l};
assign g4_addr = {row, col_r};
assign g5_addr = {row_d, col_l};
assign g6_addr = {row_d, col};
assign g7_addr = {row_d, col_r};

wire [3:0] counter_minus1;
assign counter_minus1 = counter - 4'd1;

// States
parameter Ready = 3'd0,
          Load_gc = 3'd1,
          Load_gp = 3'd2,
          Write = 3'd3,
          Finish = 3'd4;
          

// State-register
always@(posedge clk or posedge reset)
begin
    if(reset)
     cur_state <= Ready;
    else
     cur_state <= next_state;
end

// Next-state logic
always@(*)
begin
    if(reset)
    begin
        next_state = Ready;
    end
    else
    begin
        case(cur_state)
        Ready:
        begin
            if(gray_ready == 1)
             next_state = Load_gc;
            else
             next_state = Ready;
        end
        Load_gc:
        begin
            next_state = Load_gp;
        end
        Load_gp:
        begin
            if(counter == 4'd8)
             next_state = Write;
            else
             next_state = Load_gp;
        end
        Write:
        begin
            if(gc_addr == 14'd16254)
             next_state = Finish;
            else
             next_state = Load_gc; 
        end
        Finish:
        begin
            next_state = Finish;
        end
        default:
        begin
            next_state = Ready;
        end
        endcase
    end
end

// Outout logic & Datapath
always@(posedge clk or posedge reset)   // row col
begin
   if(reset)
   begin
      col <= 7'd1;
      row <= 7'd1;
   end
   else if((next_state == Write) && (col == 7'd126))
   begin
      row <= row + 7'd1;
      col <= 7'd1;
   end
   else if(next_state == Write)
      col <= col + 7'd1;
end

always@(posedge clk or posedge reset) // gc_addr
begin
    if(reset)
     gc_addr <= 14'd129;
    else if(next_state == Load_gc)
     gc_addr <= {row, col};
end

always@(posedge clk or posedge reset) // gray_addr
begin
    if(reset)
     gray_addr <= 14'd0;
    else if(next_state == Load_gc)
     gray_addr <= {row, col};
    else if (next_state == Load_gp)
    begin
        case(counter)
        4'd0: gray_addr <= g0_addr;                                                        
        4'd1: gray_addr <= g1_addr;
        4'd2: gray_addr <= g2_addr;
        4'd3: gray_addr <= g3_addr;
        4'd4: gray_addr <= g4_addr;
        4'd5: gray_addr <= g5_addr;
        4'd6: gray_addr <= g6_addr;
        4'd7: gray_addr <= g7_addr;
        endcase
    end
end

always@(posedge clk or posedge reset) // counter
begin
    if(reset)
     counter <= 4'd0;
    else if (cur_state == Write)
     counter <= 4'd0;
    else if(next_state == Load_gp)
     counter <= counter + 4'd1;
end

always@(posedge clk or posedge reset) // gray_req
begin
    if(reset)
     gray_req <= 1'b0;
    else if ((next_state == Load_gc) || (next_state == Load_gp))
     gray_req <= 1'b1;
    else
     gray_req <= 1'b0;
end

always@(posedge clk or posedge reset) // lbp_data 
begin
    if(reset)
    begin
        lbp_data <= 8'd0;
        gc_data <= 8'd0;
    end
    else if(cur_state == Load_gc)
     gc_data <= gray_data;
    else if(cur_state == Load_gp)
    begin
        if(gray_data >= gc_data)
         lbp_data <= lbp_data + (8'd1 << counter_minus1);
    end
    else if(cur_state == Write)
    begin
        lbp_data <= 8'd0;
    end
end

always@(posedge clk or posedge reset) // lbp_valid
begin
    if(reset) 
     lbp_valid <= 1'b0;
    else if(next_state == Write) 
     lbp_valid <= 1'b1;
    else 
     lbp_valid <= 1'b0;
end

always@(posedge clk or posedge reset) // lbp-addr
begin
    if(reset)
     lbp_addr <= 14'd0;
    else if(next_state == Write)
     lbp_addr <= gc_addr;
end

always@(posedge clk or posedge reset) // finish
begin
    if(reset)
     finish <= 1'b0;
    else if(cur_state == Finish)
     finish <= 1'b1;
end


//====================================================================
endmodule

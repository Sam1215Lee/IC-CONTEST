`timescale 1ns/10ps
module  CONV(
	input		clk,
	input		reset,
	output	reg	busy,	
	input		ready,	
			
	output	reg[11:0]	iaddr,
	input[19:0]		idata,	
	
	output	reg 	cwr,
	output	reg[11:0] 	caddr_wr,
	output	reg[19:0] 	cdata_wr,
	
	output	reg 	crd,
	output	reg[11:0] 	caddr_rd,
	input[19:0]	 	cdata_rd,
	
	output	reg[2:0] 	csel
	);

reg tonext;
reg signed [44:0] tmp;
reg[19:0] bias, max;
reg signed [19:0] ker[0:8];
reg signed [19:0] buff[0:8];
reg[3:0] xycnt;
reg[2:0] cur, next;
reg[5:0] ycnt,xcnt;
reg state, calcstate, done;

parameter idle = 3'd4;
parameter conv = 3'd0;
parameter pool = 3'd2;
parameter bye = 3'd3;

parameter prep = 1'd0;
parameter calc = 1'd1;

always@(*)
begin
	case(cur)
	idle:
	begin
		if(busy) next = conv;
		else next = idle;
	end
	conv:
	begin
		if(tonext)next = pool;
		else next = conv;
	end
	pool:
	begin
		if(done)next = bye;
		else next = pool;
	end
	default:
		next = bye;
	endcase
end

always @(posedge clk or posedge reset)
begin
  if(reset)
  begin
	busy <= 0;
	ker[0] <= 20'h0A89E;
	ker[1] <= 20'h092D5;
	ker[2] <= 20'h06D43;
	ker[3] <= 20'h01004;
	ker[4] <= 20'hF8F71;
	ker[5] <= 20'hF6E54;
	ker[6] <= 20'hFA6D7;
	ker[7] <= 20'hFC834;
	ker[8] <= 20'hFAC19;
	bias <= 20'h01310;
	tonext <= 0;
	xycnt <= 0;
	cur <= 3'd4;
	iaddr <= 0;
	xcnt <= 0;
	ycnt <= 0;
	state <= 1'b0;
	calcstate <= 1'b0;
	csel <= 3'd0;
	caddr_wr <= 12'd0;
	done <= 0;
	cdata_wr <= 20'd0;
	cwr <= 3'd0;
	tmp <= 0;
  end
  else 
  begin
	cur <= next;
	case(cur)
	idle:
	begin
		busy<=1;
	end
	conv:
	begin
		csel <= 3'b001;
		if(state == prep)
		begin
			cwr <= 0;
			if(xcnt == 6'd0)
			begin
				if(ycnt == 6'd0 || ycnt ==6'd63)
				begin
					if(xycnt == 3'd0)
					begin
						buff[0] <=0;
						buff[3] <=0;
						buff[6] <=0;
						xycnt <= xycnt + 1;
						if(ycnt == 6'd0)
						begin
							iaddr <= 0;
							buff[1] <= 0;
							buff[2] <= 0;
						end
						else 
						begin
							iaddr <= {ycnt,xcnt} - 12'd64;
							buff[7] <= 0;
							buff[8] <= 0;
						end
					end
					else if(xycnt == 3'd1)
					begin
						iaddr <= iaddr + 1;
						xycnt <= xycnt + 1;
						if(ycnt == 6'd0) buff[4] <= idata;
						else buff[1] <= idata;
					end
					else if(xycnt == 3'd2)
					begin
						iaddr <= iaddr + 63;
						xycnt <= xycnt + 1;
						if(ycnt == 6'd0) buff[5] <= idata;
						else buff[2] <= idata;
					end
					else if(xycnt == 3'd3)
					begin
						iaddr <= iaddr + 1;
						xycnt <= xycnt + 1;
						if(ycnt == 6'd0) buff[7] <= idata;
						else buff[4] <= idata;
						
					end
					else if(xycnt == 3'd4)
					begin
						if(ycnt == 6'd0) buff[8] <= idata;
						else buff[5] <= idata;
						state <= calc;
						xycnt <= 0;
					end
				end
				else
				begin
					if(xycnt == 3'd0)
					begin
						xycnt <= xycnt + 1;
						iaddr <= {ycnt,xcnt} - 12'd64;
						buff[0] <=0;
						buff[3] <=0;
						buff[6] <=0;
					end
					else if(xycnt == 3'd1)
					begin
						xycnt <= xycnt + 1;
						iaddr <= iaddr+1;
						buff[1] <= idata;
					end
					else if(xycnt == 3'd2)
					begin
						xycnt <= xycnt + 1;
						iaddr <= iaddr+63;
						buff[2] <= idata;
					end
					else if(xycnt == 3'd3)
					begin
						xycnt <= xycnt + 1;
						iaddr <= iaddr+1;
						buff[4] <= idata;
					end
					else if(xycnt == 3'd4)
					begin
						xycnt <= xycnt + 1;
						iaddr <= iaddr+63;
						buff[5] <= idata;
					end
					else if(xycnt == 3'd5)
					begin
						xycnt <= xycnt + 1;
						iaddr <= iaddr+1;
						buff[7] <= idata;
					end
					else if(xycnt == 3'd6)
					begin
						xycnt <= xycnt + 1;
						state <= calc;
						xycnt <= 0;
						buff[8] <= idata;
					end
				end
			end
			else if(xcnt == 6'd63)
			begin
				buff[0]<=buff[1];
				buff[1]<=buff[2];
				buff[2]<=0;
				buff[3]<=buff[4];
				buff[4]<=buff[5];
				buff[5]<=0;
				buff[6]<=buff[7];
				buff[7]<=buff[8];
				buff[8]<=0;
				state <= calc;
			end
			else
			begin
				if(ycnt == 6'd0 || ycnt ==6'd63)
				begin
					if(xycnt == 3'd0)
					begin
						xycnt <= xycnt+1;
						if(ycnt ==6'd0) iaddr <= {ycnt,xcnt} + 12'd1;
						else iaddr <= {ycnt,xcnt} - 12'd63;
						buff[0]<=buff[1];
						buff[1]<=buff[2];
						buff[3]<=buff[4];
						buff[4]<=buff[5];
						buff[6]<=buff[7];
						buff[7]<=buff[8];
					end
					else if(xycnt == 3'd1)
					begin
						xycnt <= xycnt+1;
						if(ycnt == 6'd0) buff[5]<=idata;
						else buff[2] <= idata;
						iaddr <= iaddr + 12'd64;
					end
					else if(xycnt == 3'd2)
					begin
						if(ycnt == 6'd0) buff[8]<=idata;
						else buff[5] <= idata;
						xycnt <= 0;
						state <= calc;
					end
				end
				else
				begin
					if(xycnt == 4'd0)
					begin
						xycnt <= xycnt + 1;
						iaddr <= {ycnt,xcnt} - 12'd63;
						buff[0]<=buff[1];
						buff[1]<=buff[2];
						buff[3]<=buff[4];
						buff[4]<=buff[5];
						buff[6]<=buff[7];
						buff[7]<=buff[8];
					end
					else if(xycnt == 4'd1)
					begin
						xycnt <= xycnt + 1;
						buff[2] <= idata;
						iaddr <= iaddr + 12'd64;
					end
					else if(xycnt == 4'd2)
					begin
						xycnt <= xycnt + 1;
						buff[5] <= idata;
						iaddr <= iaddr + 12'd64;
					end
					else if(xycnt == 4'd3)
					begin
						buff[8] <= idata;
						xycnt <= 0;
						state <= calc;
					end
				end
			end
			if(tonext)xycnt<=0;
		end
		else
		begin
			if(calcstate == 1'd0) //convolution
			begin
				if(xycnt == 9)
				begin
					xycnt <= 0;
					tmp <= tmp + (bias<<16);
					calcstate <= 1;
				end
				else
				begin
					xycnt <= xycnt + 1;
					tmp <= tmp + buff[xycnt] * ker[xycnt];
				end
			end
			else if(calcstate == 1'd1) 
			begin
				if(tmp[44]==1) //relu
				begin
					cdata_wr <= 0;
				end
				else //round
				begin
					cdata_wr <= tmp[31:16] + tmp[15]; 
				end
				cwr <= 1;
				caddr_wr <= {ycnt,xcnt};
				tmp <= 0;
				calcstate <= 2'd0;
				state <= prep;
				if(xcnt == 6'd63)
				begin
					xcnt <= 0;
					if(ycnt == 6'd63)
					begin
						xycnt <= 0;
						ycnt<=0;
						tonext<=1;
					end
					else ycnt <= ycnt+1;
				end
				else xcnt <= xcnt+1;
			end
		end
	end
	pool:
	begin
		if(xycnt == 4'd0)
		begin
			cwr <= 0;
			crd <= 1;
			xycnt <= xycnt + 1;
			csel <= 3'b001;
			caddr_rd <= {ycnt,xcnt};
		end
		else if(xycnt == 4'd1)
		begin
			xycnt <= xycnt + 1;
			cdata_wr <= cdata_rd;
			caddr_rd <= {ycnt, xcnt+1'd1};
		end
		else if(xycnt == 4'd2)
		begin
			xycnt <= xycnt + 1;
			if(cdata_rd > cdata_wr) cdata_wr <= cdata_rd;
			caddr_rd <= {ycnt+1'd1, xcnt};
		end
		else if(xycnt == 4'd3)
		begin
			xycnt <= xycnt + 1;
			if(cdata_rd > cdata_wr) cdata_wr <= cdata_rd;
			caddr_rd <= {ycnt+1'd1, xcnt+1'd1};
		end
		else if(xycnt == 4'd4)
		begin
			xycnt <= xycnt + 1;
			crd <= 0;
			if(cdata_rd > cdata_wr) cdata_wr <= cdata_rd;
			caddr_wr <= ((ycnt>>1)<<5) + (xcnt>>1);
			csel <= 3'd011;
			cwr <= 1;
		end
		else if(xycnt <= 4'd5)
		begin
			xycnt <= 0;
			cwr <= 0;
			if(xcnt == 6'd62)
			begin
				xcnt <= 0;
				if(ycnt == 6'd62)
				begin
					done <= 1;
					ycnt <= 0;
				end
				else ycnt <= ycnt+2;
			end
			else xcnt <= xcnt+2;
		end
		if(done)
		begin
			busy <= 0;
		end
	end
	endcase
  end
end

endmodule





module JAM (
input CLK,
input RST,
output reg [2:0] W,
output reg [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output reg Valid );

reg[2:0] buff[7:0];

reg[1:0] cur, next, state;
reg[2:0] sub1, sub2, index, val;
reg[9:0] sum;
reg cnt;


parameter IDLE = 2'd0;
parameter PERM = 2'd1;
parameter COMP = 2'd2;
parameter OUT = 2'd3;

parameter SUB1 = 2'd0;
parameter SUB2 = 2'd1;
parameter SWAP = 2'd2;
parameter REVE = 2'd3;

integer i;

always@(*)
begin
    case(cur)
    IDLE:
    begin
        if(W == 0)next = PERM;
        else next = IDLE;
    end
    PERM:
    begin
        if(index == 0 && state == SUB1) next = OUT;
        else if(sub1 >= index && state == REVE) next = COMP;
        else next = PERM;
    end
    COMP:
    begin
        if(W == 7 & cnt == 1)next = PERM;
        else next = COMP;
    end
    OUT:
    begin
        if(Valid) next = IDLE;
        else next = OUT;
    end 
    endcase
end

always@(posedge CLK or posedge RST)
begin
    if(RST)
    begin
        for(i=0;i<8;i=i+1)  // can test if we don't use for will the area decrease?
        begin
            buff[i] <= i;
        end
        cur <= IDLE;
        W <= 7;
        J <= 7;
        index <= 3'd7;
        sub1 <= 3'd0;
        sub2 <= 3'd7;
        MinCost <= 10'd0;
        MatchCount <= 4'd0;
        state <= 2'd0;
		  cnt <= 0;
    end
    else
    begin
        cur <= next;
        case(cur)
        IDLE:
        begin
            //if(W != index || W == 0) MinCost <= MinCost + Cost;
            //if(index > 3'd0 && W != 0) index <= index - 1;
            //if(W == 0) index <= 3'd7;
				MinCost <= MinCost + Cost;
            W <= W - 1;
            J <= J - 1;
            MatchCount <= 4'd1;
        end
        PERM:
        begin
            case(state)
            SUB1:
            begin
                if(index > 0) //try removing this if
                begin
                    if(buff[index] < buff[index - 3'd1])
                    begin
                        index <= index - 3'd1;
								state <= SUB1;
                    end
                    else
                    begin
                        state <= SUB2;
                        val <= 3'd7;
                        sub1 <= index - 3'd1;
                        index <= 3'd7;
                    end
                end
            end
            SUB2:
            begin
                if(buff[index] > buff[sub1] && buff[index] <= val)
                begin
                    val <= buff[index];
                    sub2 <= index;            
                end
                if(index > sub1 + 3'd1) index <= index - 3'd1;
                else state <= SWAP;
            end
            SWAP:
            begin
                state <= REVE;
                buff[sub1] <= buff[sub2];
                buff[sub2] <= buff[sub1];
                sub1 <= sub1 + 3'd1;
                index <= 3'd7;
            end
            REVE:
            begin
                if(sub1 < index)
                begin
                    buff[sub1] <= buff[index];
                    buff[index] <= buff[sub1];
                    sub1 <= sub1 + 3'd1;
                    index <= index - 3'd1;
						  state <= REVE;
                end
                else
                begin
                    state <= SUB1;
                    sub1 <= 3'd0;
                    sub2 <= 3'd7;
                    index <= 3'd6;
                    W <= 3'd7;
                    J <= buff[7];
                    sum <= 0;
                end
            end
            endcase
        end
        COMP:
        begin
		      W <= index;
            J <= buff[index];
				if(cnt == 0)
				begin
				    sum <= sum + Cost;
			   end
				//if(index < 7) 
				//begin
				    //sum <= sum + Cost;
			   //end
            if(index > 0)
            begin
                index <= index - 3'd1;
            end
            if(index == 0)
            begin
                index <= 3'd7;
            end
				if(W == 0)
				begin
				    cnt <= 1;
				end
            //if(index < 7)
            //begin
                //W <= index;
                //J <= buff[index];
                //sum <= sum + Cost;
            //end
            if(W == 7 && cnt == 1)
            begin
				    cnt <= 0;
                if(sum < MinCost)
                begin
                    MinCost <= sum;
                    MatchCount <= 1;
                end
                else if(sum == MinCost)
                begin
                    MatchCount <= MatchCount + 1;
                end
					 index <= 7;
				end
        end
        OUT:
        begin
            Valid <= 1;
            if(Valid) Valid <= 0;
        end
        endcase
    end
end


endmodule

module moore_fsm(w, clk, reset, z);

	input w, clk, reset;
	output reg z;
	
	reg [1:0] present_state, next_state;
	
	parameter A = 2'b00, B = 2'b01, C = 2'b10;
	
	// state transition logic
	always @(posedge clk, posedge reset)
	begin
		if (reset == 1)
		begin
			present_state = A;
			next_state = A;
		end
		else
		begin
			present_state = next_state;
			// next state estimation logic
			case(present_state)
				A:
				if (w == 0)
					next_state = A;
				else
					next_state = B;
				B:
				if (w == 0)
					next_state = A;
				else
					next_state = C;
				C:
				if (w == 0)
					next_state = A;
				else
					next_state = C;
				default: next_state = 2'bxx;
			endcase
		end
	end
	
	// output estimation logic
	always@(*)
	begin
		case(present_state)
			A: z = 0;
			B: z = 0;
			C: z = 1;
			default: z = 1'bx;
		endcase
	end
endmodule

module moore_fsm2_20101021(w, clk, reset, z);

	input w, clk, reset;
	output reg z;
	
	reg [2:0] present_state, next_state;
	
	parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 101, S6 = 110, S7 = 111;
	
	// state transition logic
	always @(posedge clk, posedge reset)
	begin
		if (reset == 1)
		begin
			present_state = S0;
			next_state = S0;
		end
		else
		begin
			present_state = next_state;
			// next state estimation logic
			case(present_state)
				S0:
				if (w == 0)
					next_state = S0;
				else
					next_state = S1;
				S1:
				if (w == 0)
					next_state = S5;
				else
					next_state = S2;
				S2:
				if (w == 0)
					next_state = S5;
				else
					next_state = S3;

				S3:
				if (w == 0)
					next_state = S5;
				else
					next_state = S4;
				S4:
				if (w == 0)
					next_state = S5;
				else
					next_state = S4;
				S5:
				if (w == 0)
					next_state = S6;
				else
					next_state = S1;

				S6:
				if (w == 0)
					next_state = S0;
				else
					next_state = S7;
				S7:
				if (w == 0)
					next_state = S5;
				else
					next_state = S2;
				default: next_state = 3'bxx;

			endcase
		end
	end
	
	// output estimation logic
	always@(*)
	begin
		case(present_state)
			S0: z = 0;
			S1: z = 0;
			S2: z = 0;
			S3: z = 0;
			S4: z = 1;
			S5: z = 0;
			S6: z = 0;
			S7: z = 1;
			default: z = 1'bx;
		endcase
	end
endmodule

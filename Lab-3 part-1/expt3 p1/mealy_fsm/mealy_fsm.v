module mealy_fsm(w, clk, reset, z);

	input w, clk, reset;
	output reg z;
	
	reg present_state, next_state;
	
	parameter A = 1'b0, B = 1'b1;
	
	always @ (posedge clk, posedge reset)
	begin
		if (reset == 1)
		begin
			present_state = A;
			next_state = A;
			z = 0;
		end
		else
		begin
			present_state = next_state;
			//next state estimation
			case(present_state)
				A:
				if (w == 0)
				begin
					next_state = A;
					z = 0;
				end
				else
				begin
					next_state = B;
					z = 0;
				end
				B:
				if (w == 0)
				begin
					next_state = A;
					z = 0;
				end
				else
				begin
					next_state = B;
					z = 1;
				end
			endcase
		end
	end
endmodule
		
		
module full_add(S, Cout, A, B, Cin); 
// This module implements a 1-bit full adder 
   input A, B, Cin; 
   output S, Cout;
 
   assign S = A ^ B ^ Cin; 
   assign Cout = (A & B) | (Cin & (A ^ B)); 
endmodule 
// Ellen Yu ellyu@g.hmc.edu Sep. 6 2026
// The top module that controls switch to LED logic and other module instantiation



module lab1_ey(
	input   logic [3:0] s,
	input   logic 		reset, enable,
	output  logic [2:0] led,
	output  logic [6:0] seg
);
	logic int_osc;

	assign led[0] = ~(s[1]^s[0]);
	assign led[1] = ~(s[3]&s[2]);
		
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));	
	flash_led flash_led(.clk(int_osc), .reset, .flash(led[2]), .enable);
	seven_seg seven_seg(.s, .seg);
endmodule



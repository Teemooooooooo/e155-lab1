// Ellen Yu ellyu@g.hmc.edu Sep. 6 2026
// The top module that controls switch to LED logic and other module instantiation



module lab1_ey(
	input   logic [3:0] s,
	input   logic 		reset, enable,
	output  logic [2:0] led,
	output  logic [6:0] seg
);
	
	assign led[0] = s[1]^s[2];
	assign led[1] = s[3]&s[2];
		
	flash_led flash_led(.reset, .flash(led[2]));
	seven_seg seven_seg(.s, .seg);
endmodule



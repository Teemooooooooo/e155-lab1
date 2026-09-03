module top(
	input   logic [3:0] s,
	output  logic [2:0] led,
	output  logic [6:0] seg
);
	logic int_osc;
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	// Simple clock divider
	always_ff @(posedge int_osc)
		begin
			counter <= counter + 1;
		end
	always_comb 
		begin
			case (s[1:0])
				2'b00:	led[0] = 0;
				2'b01:	led[0] = 1;
				2'b10:	led[0] = 1;
				2'b11:	led[0] = 0;
			endcase
			case (s[3:2])
				2'b00:	led[1] = 0;
				2'b01:	led[1] = 0;
				2'b10:	led[1] = 0;
				2'b11:	led[1] = 1;
			endcase
			// code for the segment display
			case (s)
				4'h0:	seg = 7'b1111110;
				4'h1:	seg = 7'b0110000;
				4'h2:	seg = 7'b1101101;
				4'h3:	seg = 7'b1111001;
				4'h4:	seg = 7'b0110011;
				4'h5:	seg = 7'b1011011;
				4'h6:	seg = 7'b1011111;
				4'h7:	seg = 7'b1110000;
				4'h8:	seg = 7'b1111111;
				4'h9:	seg = 7'b1111011;
				4'hA:	seg = 7'b1110111;
				4'hB:	seg = 7'b0011111;
				4'hC:	seg = 7'b1001110;
				4'hD:	seg = 7'b0111101;
				4'hE:	seg = 7'b1001111;
				4'hF:	seg = 7'b1000111;
			endcase
		end
endmodule


module topref(
	input 	logic	mcu_blink_in,
	output 	logic fpga_blink_out, mcu_echo_led
);

	logic int_osc;
	logic pulse;
	logic led_state = 0;
	logic [24:0] counter = 0;
	
	// Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	// Simple clock divider
	always_ff @(posedge int_osc)
		begin
			counter <= counter + 1;
		end
		
  assign fpga_blink_out = counter[24];
	assign mcu_echo_led = mcu_blink_in;

endmodule
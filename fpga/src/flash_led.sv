// Ellen Yu ellyu@g.hmc.edu Sep. 6 2026
// This module controls the LED to flash at 2.4 Hz

module flash_led #(parameter COUNTER_SIZE = 25, MAX_THRESHOLD = 24'd10000000)(
	input   logic 		clk, reset, enable,
	output  logic 		flash
	);
	logic [COUNTER_SIZE-1:0] counter = 0;

	// Simple clock divider
	always_ff @(posedge clk)
		if (~reset)
			begin
				flash <= 0;
				counter <= 0;
			end
		else
			if (enable)
				if (counter == (MAX_THRESHOLD - 1)) 
					begin
						counter <= 0;
						flash 	<= ~flash;
					end
				else
					begin
						counter <= counter + 1;
						flash <= flash;
					end
	

endmodule
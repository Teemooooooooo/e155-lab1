// Ellen Yu ellyu@g.hmc.edu Sep. 7 2026
// Testbench for the LED flashing at 2.4 Hz
// tests reset, enable, and max count behavior

`timescale 1 ns/1 ns

module flash_led_tb();
  logic           clk;    // system clock
  logic           reset, enable;  // active high reset, enable
  logic           flash;      // 1 bit LED output

    flash_led dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .flash(flash)
    );

  // generate clock
  always begin
      clk = 0; #5;
      clk = 1; #5;
  end

  // apply stimuli and check outputs
  initial begin
    reset = 0;
    enable = 1;
    #22 reset = 1;

    // for each test case we setup the inputs, wait for the outputs to update,
    // and then check that the outputs match what we expect using `assert`
    // in this case, the leds use combinational logic, so we don't *need* to wait
    // a full clock cycle (#10)
   
    // testing reset behavior
        #50;
        reset = 1'b0;
        #20;
        assert (dut.counter == 24'b0)
            $display("PASSED! Counter resetted as expected at time: %0t.", $time);
        else 
            $error("FAILED! Counter behaves incorrectly at time: %0t.", $time); 
        
        assert (flash == 'b0)
            $display("PASSED! LED is off as expected at time: %0t.", $time);
        else 
            $error("FAILED! LED behaves incorrectly at time: %0t.", $time); 
        // ... add the rest of the states you want to check here

    // testing enable behavior (off)
        enable = 1'b0;
        reset = 1'b0;
        #10;
        reset = 1'b1;
        #50;
        assert (dut.counter == 24'b0)
            $display("PASSED! Counter did not increment at time: %0t.", $time);
        else 
            $error("FAILED! Counter behaves incorrectly at time: %0t.", $time); 
        
        assert (flash == 'b0)
            $display("PASSED! LED is off as expected: %0t.", $time);
        else 
            $error("FAILED! LED behaves incorrectly at time: %0t.", $time); 
        
    // testing enable behavior (on)
        enable = 1'b1;
        reset = 1'b0;
        #10;
        reset = 1'b1;
        #50;
        assert (dut.counter == 24'b101)
            $display("PASSED! Counter did not increment at time: %0t.", $time);
        else 
            $error("FAILED! Counter behaves incorrectly at time: %0t.", $time); 
        
        assert (flash == 'b0)
            $display("PASSED! LED is off as expected: %0t.", $time);
        else 
            $error("FAILED! LED behaves incorrectly at time: %0t.", $time); 

    // testing max counter behavior (LED on)
        reset = 1'b0;
        #10;
        reset = 1'b1;
        #100000000; // counter reach MAX_threshold
		assert (dut.counter == 24'b0)
            $display("PASSED! Counter got back to zero as expected: %0t.", $time);
        else
            $display("FAILED! Counter has %0d at time: %0t.", dut.counter, $time);
		
        assert (flash == 1'b1)
            $display("PASSED! LED turned on as expected: %0t.", $time);
        else
            $display("FAILED! LED has incorrect behavior at time: %0t.", $time);
    
    // then wait another max LED should turn off
        #100000000;
		#10;
        assert (flash == 1'b0)
            $display("PASSED! LED turned off as expected at counter %0d: %0t.", dut.counter, $time);
        else
            $display("FAILED! LED has incorrect behavior at time: %0t.", $time);
    #100 $stop;
  end
endmodule
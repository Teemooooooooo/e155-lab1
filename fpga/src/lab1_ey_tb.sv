// Ellen Yu ellyu@g.hmc.edu Sep. 7 2026
// Testbench for the toplevel

`timescale 1 ns/1 ns

module lab1_ey_tb();
  logic [3:0]   s;
  logic 		reset, enable;
  logic [2:0]   led; 
  logic [6:0]   seg;
    lab1_ey dut (
        .s(s),
        .enable(enable),
        .reset(reset),
        .led(led),
        .seg(seg)
    );

  // apply stimuli and check outputs
  initial begin
    enable = 1'b1;
	s = 4'b0;
	reset = 1;
    #22 reset = 0;

    // for each test case we setup the inputs, wait for the outputs to update,
    // and then check that the outputs match what we expect using `assert`
    // in this case, the leds use combinational logic, so we don't *need* to wait
    // a full clock cycle (#10)

    // test 1
        s[1:0] = 2'b00;                // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b0)       // check outputs
            $display("PASSED! The led 0 controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led 0 controller behaves incorrectly at time: %0t.", $time); 
            
    // test 2
        s[1:0] = 2'b01;                // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b1)       // check outputs
            $display("PASSED! The led 0 controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led 0 controller behaves incorrectly at time: %0t.", $time); 
      
    // test 3
        s[1:0] = 2'b10;                // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b1)       // check outputs
            $display("PASSED! The led 0 controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led 0 controller behaves incorrectly at time: %0t.", $time); 
      
    // test 4
        s[1:0] = 2'b11;                // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b0)       // check outputs
            $display("PASSED! The led 0 controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led 0 controller behaves incorrectly at time: %0t.", $time); 
      
    // test 1b
        s[3:2] = 2'b00;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b0)       // check outputs
            $display("PASSED! The led 1 controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led 1 controller behaves incorrectly at time: %0t.", $time); 

    // test 2b
        s[3:2] = 2'b01;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b0)       // check outputs
            $display("PASSED! The led 1 controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led 1 controller behaves incorrectly at time: %0t.", $time); 
      
    // test 3b
        s[3:2] = 2'b10;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b0)       // check outputs
            $display("PASSED! The led 1 controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led 1 controller behaves incorrectly at time: %0t.", $time); 
      
    // test 4b
        s[3:2] = 2'b11;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b1)       // check outputs
            $display("PASSED! The led 1 controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led 1 controller behaves incorrectly at time: %0t.", $time); 
      
    #100 $stop;
  end
endmodule
// Ellen Yu ellyu@g.hmc.edu Sep. 7 2026
// Testbench for the switch to seven_segment display logic 

`timescale 1 ns/1 ns

module seven_seg_tb();
  logic   [3:0]   s;      // 4-bit input switches
  logic   [6:0]   seg;    // 7 segment display

    seven_seg dut (
        .s(s),
        .seg(seg)
    );


  // apply stimuli and check outputs
  initial begin
    // for each test case we setup the inputs, wait for the outputs to update,
    // and then check that the outputs match what we expect using `assert`
    // in this case, the leds use combinational logic, so we don't *need* to wait
    // a full clock cycle (#10)

    // test 1
        s = 4'b0000;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1111110)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 

    // test 2
        s = 4'b0001;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0110000)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time);         
    
    // test 3
        s = 4'b0010;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1101101)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 

    // test 4
        s = 4'b0011;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1111001)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 
    
    // test 5
        s = 4'b0100;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0110011)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 
    
    // test 6
        s = 4'b0101;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1011011)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 
    
    // test 7
        s = 4'b0110;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1011111)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 
    
    // test 8
        s = 4'b0111;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1110000)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 

    // test 9
        s = 4'b1000;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1111111)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 

    // test 10
        s = 4'b1001;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1111011)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 
    
    // test 11
        s = 4'b1010;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1110111)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 
    
    // test 12
        s = 4'b1011;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0011111)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time);
    
    // test 13
        s = 4'b1100;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1001110)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 
    
    // test 14
        s = 4'b1101;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0111101)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 
    
    // test 15
        s = 4'b1110;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1001111)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 
    
    // test 16
        s = 4'b1111;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1000111)       // check outputs
            $display("PASSED! The 7 segment display behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The 7 segment display behaves incorrectly at time: %0t.", $time); 
    #100 $stop;
  end
endmodule
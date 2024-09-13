////////
// 
//	comp300-fa22-p1/top.v
//
//	Project 1 Starting Code
//	
//	Simple binary counter and test circuit
//
//	Chuck Pateros
//	University of San Diego
//	2022-09-16
//
////////
// look in upduino3.pcf for the mapping of signals to UPduino board pins
module top (
    input CLK,         // 12MHz clock provided by UPduino board
    output [6:0] SEG,  // seven-segment display segments (active low)
    output [3:0] COMM, // seven-segment display common anodes (active high) 
    output [3:0] DBG,  // LEDs installed into breadboard (active high)
    output [2:0] RGB   // RGB LED is built into UPduino board (active low)
);
 
    reg [6:0] seg;
    reg [2:0] rgb = 0;
    
    // drive board LEDs

    // Segments 
    assign SEG = seg; // for second week, change to "assign SEG = seg;" (output of case)!
    assign COMM = ~4'b0000;
    assign RGB = rgb;

    ////////
    // make a simple counter circuit 
    ////////

    // keep track of count
    reg [27:0] counter;

 
    // increment the counter every clock
    always @(posedge CLK) begin
        counter <= counter + 1;
        if (&counter[16:10])
        	rgb <= counter[23:21];
        else
        	rgb <= 3'b111;
    end

    // Use debug LEDs to show count
    assign DBG = counter[26:23];

    always @(*) begin
        case(counter[26:23]) 
            4'b0000   : seg = 7'b1000000; // 0 CEO
            4'b0001   : seg = 7'b1001111; // 1 PM
            4'b0010   : seg = 7'b0100100; // 2 PM
            4'b0011   : seg = 7'b0110000; // 3 DEV
            4'b0100   : seg = 7'b0011001; // 4 DEV
            4'b0101   : seg = 7'b0010010; // 5 DEV
            4'b0110   : seg = 7'b0000010; // 6 DEV
            4'b0111   : seg = 7'b1111000; // 7 DEV
            4'b1000   : seg = 7'b0000000; // 8 CEO
            4'b1001   : seg = 7'b0011000; // 9 Test
            4'b1010   : seg = 7'b0001000; // 10 (A) Test
            4'b1011   : seg = 7'b0000011; // 11 (b) Test 
            4'b1100   : seg = 7'b1000110; // 12 (C) Test 
            4'b1101   : seg = 7'b0100001; // 13 (d) Test 
            4'b1110   : seg = 7'b0000110; // 14 (E) Test
            4'b1111   : seg = 7'b0001110; // 15 (F) Test
            default   : seg = 7'b0000000; // go dark in case of error
        endcase // hex to seven-segment case
    end // combinational circuits


endmodule

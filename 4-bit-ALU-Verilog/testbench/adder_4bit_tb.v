`timescale 1ns/1ps 

module adder_4bit_tb;
    reg  [3:0] A, B;
    reg  cin;
    wire [3:0] sum;
    wire cout;

  initial begin
    $dumpfile("simulation/adder_4bit_test.vcd");
    $dumpvars(0, adder_4bit_tb);

   
end 



    adder_4bit dut (
        A, B, cin, sum, cout); 

    integer i, j, k;
    reg [4:0] answer;  
    initial begin
        $display("Starting the test...\n");

        for(i=0;i<16;i++) begin
            for(j=0;j<16;j++) begin //checking all combinations
                for(k=0;k<2; k++) begin
                    A = i;
                    B = j;
                    cin = k;

                    #5;  

                    answer = A + B + cin;
                    if({cout, sum} == answer)//compare the outputs 
                        $display("PASS  A=%0d,B=%0d,Cin=%0d,Sum=%0d",
                                  A, B, cin, answer);
                    else
                       $display("FAIL A=%0d,B=%0,Cin=%0d,Got=%b%b  Expected=%b",
                                  A, B, cin, cout, sum, answer);

                end
            end
        end

        $display("\n All tests done");
        $finish;
    end

endmodule
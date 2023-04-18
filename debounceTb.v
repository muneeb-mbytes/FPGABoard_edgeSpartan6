module testtb;

	// Inputs
	reg button;
	reg clk;

	// Outputs
	wire result;

	// Instantiate the Unit Under Test (UUT)
	debounce_ckt uut (
		.button(button), 
		.clk(clk), 
		.result(result)
	);

	initial clk=0;
always #5 clk=~clk;

initial begin 
test1();//Calling a task
#10;
 test2(); //Calling a task
 #10;
 test3();//Calling a task
#10;
test4();//Calling a task
#10;
test5();
end

task test1();  

begin
reset=1;
reset=0;
button=0;
#5; button=1;
#90; button=0;

end
endtask  

task test2(); 
begin
reset=1;
reset=0;
button=0;
#5; button=1;
#10;button=0;
#47;button=1;
#57;buttonb=0;
end
endtask  

task test3(); 
begin
reset=1;
reset=0;
#5:button=0;
#20;button=1;
#20;button=0;
#20;button=1;
#20;button=0;
end
endtask  

task test4(); 
begin
reset=1;
reset=0;
#5; button=1;
#10;button=0;
#10;button=1;
#10;button=0;
#10;button=1;
#10;button=0;
#10;button=1;
#10;button=0;
#10;button=1;
#10;button=0;
end
endtask  

task test5(); 
begin

reset=1;
#5 reset=0;
    button=0;
#20; button=1;
#5; button=0;
#8; button=1;
#27;button=0; 



endmodule

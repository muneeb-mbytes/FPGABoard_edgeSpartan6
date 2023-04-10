`timescale 1ns / 1ps



module digits(

	 input stop,
    input load,

    input updown,

    input clk_1Hz,

    input reset,

	 output reg buzzer,

    output reg [3:0] ones,

    output reg [3:0] tens

    );
	 reg [2:0] count = 0;

    // ones reg control

    always @(posedge clk_1Hz or posedge reset or posedge load) 

    begin

   if(updown)

     //up counting of ones

     begin

	 if(load)

            ones <= 0;

         else

            if(reset)

               ones <= 0;
 
           else
            if(stop)
				  begin
				    ones <= ones;
				  end
				else
            if(ones == 9)

                ones <= 0;

            else

                ones <= ones + 1;

		end

   else

     //down counting of ones

     begin

	   if(load)

	      ones <= 0;

	    else

           if(reset)

              ones <= 9;

            else
             if(stop)
				 begin 
				 ones <= ones;
				 end
				 else
            if(ones == 0)

                ones <= 9;

            else

                ones <= ones - 1;

	end

    end

    // tens reg control       

    always @(posedge clk_1Hz or posedge reset or posedge load)

     begin

   if(updown)

	  //up counting of tens

	  begin

	    if(load) begin

		    tens <= 9;
		    buzzer <= 0;
	     end

	    else

          if(reset) begin

            tens <= 0;
		      buzzer <= 0;
	       end

         else
		     if (count > 0) begin   // to turn buzzer off after one second
                  count <= count - 1;
                  buzzer <= 0;
                end
	      else
		       if(stop) begin
					    tens <= tens;
						 end
             else

                if(ones == 9) begin

                    if(tens == 9)

		               begin

                        tens <= 0;
								buzzer <= 1'b1;
								count <= 1;         // The period of 1Hz clock is 1s. 

		               end                   // Thus 1s x count = 1s, hence count=1 

                   else

                        tens <= tens + 1;
		       end

		end

      else

      //down counting of tens

	    begin

	    if(load) begin

		    tens <= 1;
		    buzzer <= 0;
		  end

	     else

            if(reset) begin

              tens <= 9;
		        buzzer <= 0;
		     end
	     else
		if (count > 0) begin   // to turn buzzer off after one second
                       count <= count - 1;
                       buzzer <= 0;
                 end

             else
				     if(stop) begin
					    tens <= tens;
						 end
                 else
                 if(ones == 0) begin

                     if(tens == 0)

		        begin

                   tens <= 9;

		             buzzer <= 1'b1;
			          count <= 1;

		          end

                   else

                            tens <= tens - 1;
		   end  

		end
		

	end

	  endmodule



  


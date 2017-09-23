DISPLAY MODULE:


Display module on VGA (for testing purposes only)
module display_onVGA(    input clock,
   	 input reset,
   	 input pause,
   	 input [15:0] data_audio_in,
            	output reg [8:0] x_coords,
   	 output reg [7:0] y_coords,
   	 output [2:0] color_on_vga,
   	 output plot_on_vga);
 
 
 
reg [31:0] delay;// delay counter

//FSM state declarations
reg current_state;
reg next_state;

//state values
parameter plot = 0
parameter no_ploty = 1;

always @(posedge clock)//if reset is pressed, assigns the next state as a no plot state
begin
    if(reset)
      	next_state <= no_ploty;
    else
      	next_state <= current_state;
end
 
always @(*) begin // FSM for plotting y on the VGA
    current_state = next_state;
    case(next_state)
   	 plot: begin
                  	if(y_coords == 239)//sto
                  	current_state = no_plot;
                  	end
   	 no_ploty: begin
                     	if(!pause && (delay == 5000))
                     	current_state = plot;
                     	end
    endcase
end
 
 
//X coordinates counter                   	 
always @(posedge clock)
begin
    if(reset) //if reset is pressed
   	   begin
   		delay <= 0;
   		x_coords <= 0;
          	end
 
    else if(next_state == no_ploty)//if y coordinate is available, plot it as incrementing one x coordinate
   	 if(delay == 5000)
                    	begin
   		 delay <= 0;
   		 if(x_coords ==319)
                      	x_coords = 0;
                    	else
                      	x_coords = x_coords +1;
   	     	end
   	else delay <= delay + 1; //delay counter
end
 
always @(posedge clock) // Y counter for y coordinates
begin
    if(reset || (next_state == no_ploty))//checks if the next state is a reset or a no plot y case
       	y_coords <= 0; //  resets the y coordinate to 0
    else if(y_coords < 239)
       	y_coords <= y_coords + 1; // else counts up the y_coordinate
end
 
//plots the point on the screen as an average value of data received
assign plot_on_vga = (next_state == plot);
assign color_on_vga = (y_coords == 8'd120+{data_audio_in[15], data_audio_in[6:0]});
 
endmodule
//Re-written with Reference to and an adaptation of the display module from the video_recorder demo

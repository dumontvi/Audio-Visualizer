RECORD/PLAY MODULE:

module recordram(
    input CLOCK_50,
    	input reset,
    	input    [15:0]    audio_in,
    input    audio_out_allowed, audio_in_available,
    	input    play, record, pause,
    input    [1:0]    speed
    	input    [15:0]    ram_data_out,
    input    ram_valid, ram_waitrq,  
    
    	output reg [21:0] ram_addr,
    output    [15:0]    ram_data_in,
    output    ram_read, ram_write,
    	output    [15:0]    audio_out,
    output    write_audio_out, read_audio_in,
 
    
);
 
 
 
reg [2:0] current_state;
reg [2:0] next_state;
 
//FSM for record, play and pause
localparam		     	initial_state = 0,
   		 RECORD_WAIT = 1,
   		 RECORD_Address = 2,
   		 RECORD_RAM_WAIT = 3,
   		 PLAY_read = 4,
   		 PLAY_WAIT = 5,
   		 PLAY_next_Address = 6,
   		 DATAin_check = 7;
 
always @(*) begin
    current_state = next_state;
    case(next_state)
   	 initial_state: current_state = DATAin_check;
   	 DATAin_check://checks if data input is either record or play
   		 if(!pause)
   			 if(play) current_state = PLAY_WAIT;
   			 else if(record) current_state = RECORD_WAIT;
   			 else current_state = initial_state;
 
  			 RECORD_WAIT: if(audio_in_available) current_state = RECORD_Address;
   	 RECORD_Address: current_state = RECORD_RAM_WAIT;
   	 RECORD_RAM_WAIT: if(!ram_waitrq) current_state = DATAin_check;
 
   	 PLAY_WAIT: if(audio_out_allowed) current_state = PLAY_read;
   	 PLAY_read: if(!ram_waitrq && ram_valid) current_state = PLAY_next_Address;  
   	 PLAY_next_Address: current_state = DATAin_check;
    endcase
end

//if reset is pressed
always @(posedge CLOCK_50)
    if(reset) next_state <= DATAin_check;
    else next_state <= current_state;
 
 
// Increments the address for the SDRAM  
always @(posedge CLOCK_50)
    if(reset) ram_addr <= 0;
    else
   	 case(next_current_stateate)
   		 initial_current_stateate: ram_addr <= 0;
   		 RECORD_Address: ram_addr <= ram_addr + 1;
   		 PLAY_next_Address: ram_addr <= ram_addr + 1 + speed;
   	 endcase

 
 
//Connects the audio contoller to the RAM  
assign read_audio_in = (next_state == RECORD_Address) || (next_state == initial_state && audio_in_available);
assign write_audio_out = (current_state == PLAY_next_Address);
assign ram_data_in = audio_in;
assign audio_out = ram_data_out;
assign ram_write = (next_state == RECORD_RAM_WAIT);
assign ram_read = (next_state == PLAY_read);
  endmodule 
//Re-written with Reference to and an adaptation of the display module from the video_recorder demo


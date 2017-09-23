TOP_LEVEL_MODULE:
module top_module(
inout    [15:0]    DRAM_DQ,   			 //    SDRAM Data bus 16 Bits
output    [11:0]    DRAM_ADDR,   			 //    SDRAM Address bus 12 Bits
output   		 DRAM_LDQM,   			 //    SDRAM Low-byte Data Mask  
output   		 DRAM_UDQM,   			 //    SDRAM High-byte Data Mask
output   		 DRAM_WE_N,   			 //    SDRAM Write Enable
output   		 DRAM_CAS_N,   			 //    SDRAM Column Address Strobe
output   		 DRAM_RAS_N,   			 //    SDRAM Row Address Strobe
output   		 DRAM_CS_N,   			 //    SDRAM Chip Select
output   		 DRAM_BA_0,   			 //    SDRAM Bank Address 0
output   		 DRAM_BA_1,   			 //    SDRAM Bank Address 0
output   		 DRAM_CLK,   			 //    SDRAM Clock
output   		 DRAM_CKE,   			 //    SDRAM Clock Enable
 
input   		 CLOCK_50,   			 //    On Board 50 MHz
 
input    [3:0]    KEY,   				 //    Pushbutton[3:0]
input    [17:0]    SW,   					 //    Toggle Switch[17:0]
output    [6:0]    HEX0,   				 //    Seven Segment Digit 0
output    [6:0]    HEX1,   				 //    Seven Segment Digit 1
output    [6:0]    HEX2,   				 //    Seven Segment Digit 2
output    [6:0]    HEX3,   				 //    Seven Segment Digit 3
output    [6:0]    HEX5,
 
 
inout   		 AUD_ADCLRCK,   		 //    Audio CODEC ADC LR Clock
input   		 AUD_ADCDAT,   			 //    Audio CODEC ADC Data
inout   		 AUD_DACLRCK,   		 //    Audio CODEC DAC LR Clock
output   		 AUD_DACDAT,   			 //    Audio CODEC DAC Data
inout   		 AUD_BCLK,   			 //    Audio CODEC Bit-Stream Clock
output   		 AUD_XCK,   			 //    Audio CODEC Chip Clock
 
inout   		  FPGA_I2C_SDAT,   			 //    I2C Data
output   		 FPGA_I2C_SCLK,   			 //    I2C Clock
 
output   		 VGA_CLK,  				 //    VGA Clock
output   		 VGA_HS,   				 //    VGA H_SYNC
output   		 VGA_VS,   				 //    VGA V_SYNC
output   		 VGA_BLANK,   			 //    VGA BLANK
output   		 VGA_SYNC,   			 //    VGA SYNC
output    [9:0]    VGA_R,  				 //    VGA Red[9:0]
output    [9:0]    VGA_G,        			 //    VGA Green[9:0]
output    [9:0]    VGA_B, 				 //    VGA Blue[9:0]
output [13:0]GPIO_0,
output [13:0]GPIO_1
);
 
defparam
    Audio_Controller.USE_MIC_INPUT = 1; // 0 - for line in or 1 - for microphone in
 
 
wire reset = !KEY[0];//reset button


//ram variables
wire [21:0] ram_addr;
wire [15:0] ram_data_in, ram_data_out;
wire ram_valid, ram_waitrq, ram_read, ram_write;


//audio controller variables
wire [15:0] audio_out, audio_in;
wire audio_out_allowed, audio_in_available, write_audio_out, read_audio_in;


//VGA adapter variables
wire vga_color;
wire [8:0] vga_x;
wire [7:0] vga_y;
wire vga_plot;


//audio control variables
wire playr ;
assign playr = ~KEY[2];
wire pauser;
assign pauer = SW[0];
wire recorder = !KEY[1];
wire [1:0] speeder; 
assign speeder = SW[2:1];
wire [3:0] scale = SW[6:3];


//chooses whether to output data or input data based on playr key pressed
wire [15:0] original_audio = playr ? audio_out : audio_in;


//averages out the received data and scales each bit to be displayed on the LED matrix. This helps us show that the LED matrix responds according to each scale and gain zone.
reg [15:0] gain_scale;
 
always @(*)
    case(scale)
   	 0: gain_scale = original_audio;
   	 1: gain_scale = {{2{original_audio[15]}}, original_audio[14:1]};
   	 2: gain_scale = {{3{original_audio[15]}}, original_audio[14:2]};
   	 3: gain_scale = {{4{original_audio[15]}}, original_audio[14:3]};
   	 4: gain_scale = {{5{original_audio[15]}}, original_audio[14:4]};
   	 5: gain_scale = {{6{original_audio[15]}}, original_audio[14:5]};
   	 6: gain_scale = {{7{original_audio[15]}}, original_audio[14:6]};
   	 7: gain_scale = {{8{original_audio[15]}}, original_audio[14:7]};
   	 8: gain_scale = {{9{original_audio[15]}}, original_audio[14:8]};
   	 9: gain_scale = {{10{original_audio[15]}}, original_audio[14:9]};
   	 10: gain_scale = {{11{original_audio[15]}}, original_audio[14:10]};
   	 11: gain_scale = {{12{original_audio[15]}}, original_audio[14:11]};
   	 12: gain_scale = {{13{original_audio[15]}}, original_audio[14:12]};
   	 13: gain_scale = {{14{original_audio[15]}}, original_audio[14:13]};
   	 14: gain_scale = {{15{original_audio[15]}}, original_audio[14:14]};
   	 15: gain_scale = {16{original_audio[15]}};
    endcase
 
 
 
//concatenates the audio as a 32-bit number
wire [31:0] comb_audio;
assign comb_audio = {audio_in, 16'bx};
 
 
///////////////////////////////////////////////////////////////MODULES//////////////////////////////////////////////////////////////////////////


//////////////SDRAM Module from Altera to store the audio bits for recordering purposes/////////////////
 
SDRAM_PLL pll(.inclk0(CLOCK_50), .c0(DRAM_CLK), .c1(VGA_CLK), .c2(AUD_XCK));
 
sdram ram(    .zs_addr(DRAM_ADDR), .zs_ba({DRAM_BA_1,DRAM_BA_0}), .zs_cas_n(DRAM_CAS_N), .zs_cke(DRAM_CKE), .zs_cs_n(DRAM_CS_N), .zs_dq(DRAM_DQ),
   		 .zs_dqm({DRAM_UDQM,DRAM_LDQM}), .zs_ras_n(DRAM_RAS_N), .zs_we_n(DRAM_WE_N),
   		 .clk(CLOCK_50), .az_addr(ram_addr), .az_be_n(2'b00), .az_cs(1), .az_data(ram_data_in), .az_rd_n(!ram_read), .az_wr_n(!ram_write),
   		 .reset_n(!reset), .za_data(ram_data_out), .za_valid(ram_valid), .za_waitrequest(ram_waitrq));
 
////////////////////////////////////Audio controller Module from Altera -  activates ADC and DAC/////////////
Audio_Controller Audio_Controller (    .clk(CLOCK_50), .reset(reset), .clear_audio_in_memory(), .read_audio_in(read_audio_in), .clear_audio_out_memory(),
   								 .left_channel_audio_out({audio_out, 16'b0}), .right_channel_audio_out({audio_out, 16'b0}), .write_audio_out(write_audio_out),
   								 .AUD_ADCDAT(AUD_ADCDAT), .AUD_BCLK(AUD_BCLK), .AUD_ADCLRCK(AUD_ADCLRCK), .AUD_DACLRCK(AUD_DACLRCK), .FPGA_I2C_SDAT(FPGA_I2C_SDAT),
   								 .audio_in_available(audio_in_available), .left_channel_audio_in(comb_audio), .right_channel_audio_in(),
   								 .audio_out_allowed(audio_out_allowed), .AUD_XCK(), .AUD_DACDAT(AUD_DACDAT), .FPGA_I2C_SCLK(FPGA_I2C_SCLK));
 
 
//////////////////////////////////Records or Plays Audio and connects the RAM to the audio controller////////


recordram recorder1( CLOCK_50,reset,audio_in,audio_out_allowed,audio_in_available, playr, recorder, pauser, speeder,ram_data_out,ram_valid, ram_waitrq, ram_addr, ram_data_in, ram_read, ram_write, 
   		 audio_out,write_audio_out, read_audio_in);
 
 
//VGA module to displayr analog audio waves(During TESTING only) adapted from Altera IPcore


vga_adapter VGA(
   		 .resetn(!reset),
   		 .clock(CLOCK_50),
   		 .colour(vga_color),
   		 .x(vga_x),
   		 .y(vga_y),
   		 .plot(vga_plot),
   		 .VGA_R(VGA_R),
   		 .VGA_G(VGA_G),
   		 .VGA_B(VGA_B),
   		 .VGA_HS(VGA_HS),
   		 .VGA_VS(VGA_VS),
   		 .VGA_BLANK(VGA_BLANK),
   		 .VGA_SYNC(VGA_SYNC),
   		 .clock_25(VGA_CLK));
   	 defparam VGA.RESOLUTION = "320x240";
   	 defparam VGA.MONOCHROME = "TRUE";


////////Displayr module to get x and y coordinates to plot on VGA(During TESTING only)////////////////


display_onVGA displayr(CLOCK_50, reset, pauser, gain_scale, vga_x, vga_y, vga_color, vga_plot);
 
/////////////////////////////////////////////HEX displayr for the for the DE1 soc board///////////////////////////////////////


//Recording address check/seconds recordered//
hex_display h1(ram_addr[17:14], HEX2);
hex_display h2(ram_addr[21:18], HEX3);


//Showcases playrback speeder//
hex_display h3({2'b00,speeder}, HEX1);


//Showcases the gain scale//
hex_display h4(scale, HEX0);


////////////////////////////LED scale and displayr module to displayr everything on the matrix////////////////////////


LEDshrink l0(vga_x,vga_y,CLOCK_50,vga_color,GPIO_0,GPIO_1);
 
 Endmodule


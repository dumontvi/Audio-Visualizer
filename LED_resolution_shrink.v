LEDshrink module:

//Embedded within is the LED Lookup Table
`timescale 1ns/1ns
module LEDshrink(
input [8:0]x,
input [7:0]y,
input clock,
input [2:0]colour,
output reg [13:0] positive,
output reg [13:0] negative

);
reg [3:0]x_shrink;
reg [3:0]y_shrink;
reg state;
 reg [31:0] ctr;
reg [25:0]count;

/////////////////////////////////////////////////Start the Resolution Shrink Logic///////////////////////////////////////////////////
always @(posedge clock)
begin
  if(count == 25'd800)
		  begin
			  if (x==9'd0)
					begin
					 if (((y>8'd120)||(y<8'd120))&&(y<8'd137))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink=4'd0;
									y_shrink=4'd1;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink=4'd0;
									y_shrink=4'd1;
									//if black
									end
								//y evalutes true
								end					
							else if ((y>8'd137)&&(y<8'd154))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink=4'd0;
									y_shrink=4'd2;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink=4'd0;
									y_shrink=4'd2;
									//if black
									end
								//y evalutes true
								end		
							else if ((y>8'd154)&&(y<8'd171))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink=4'd0;
									y_shrink=4'd3;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink=4'd0;
									y_shrink=4'd3;
									//if black
									end
								//y evalutes true
								end							
							else if ((y>8'd171)&&(y<8'd188))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink=4'd0;
									y_shrink=4'd4;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink=4'd0;
									y_shrink=4'd4;
									//if black
									end
								//y evalutes true
								end							
							else if ((y>8'd188)&&(y<8'd222))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink=4'd0;
									y_shrink=4'd5;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink=4'd0;
									y_shrink=4'd5;
									//if black
									end
								//y evalutes true
								end			
							else if ((y>8'd222)&&(y<8'd240))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink=4'd0;
									y_shrink=4'd6;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink=4'd0;
									y_shrink=4'd6;
									//if black
									end
								//y evalutes true
								end		
							else if (y==8'd239)
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink=4'd0;
									y_shrink=4'd7;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink=4'd0;
									y_shrink=4'd7;
									//if black
									end
								//y evalutes true
								end													
						//x=0
						end
					
					
					
					
					
					if ((x==9'd45))
					begin
					
			
							 if ((y>8'd120)&&(y<8'd137))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd1;
									y_shrink=4'd1;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd0;
									y_shrink=4'd0;
									//if black
									end
								//y evalutes true
								end					
							else if ((y>8'd137)&&(y<8'd154))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd1;
									y_shrink=4'd2;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd1;
									y_shrink=4'd2;
									//if black
									end
								//y evalutes true
								end		
							else if ((y>8'd154)&&(y<8'd171))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd1;
									y_shrink=4'd3;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd1;
									y_shrink=4'd3;
									//if black
									end
								//y evalutes true
								end							
							else if  ((y>8'd171)&&(y<8'd188))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd1;
									y_shrink=4'd4;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd1;
									y_shrink=4'd4;
									//if black
									end
								//y evalutes true
								end							
							else if ((y>8'd188)&&(y<8'd222))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd1;
									y_shrink=4'd5;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd1;
									y_shrink=4'd5;
									//if black
									end
								//y evalutes true
								end			
							else if ((y>8'd222)&&(y<8'd240))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd1;
									y_shrink=4'd6;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd1;
									y_shrink=4'd6;
									//if black
									end
								//y evalutes true
								end		
							else if (y==8'd239)
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd1;
									y_shrink=4'd7;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd1;
									y_shrink=4'd7;
									//if black
									end
								//y evalutes true
								end													
					//x=1
					end
					
					else if ((x==9'd90))
					begin		
				
							 if ((y>8'd120)&&(y<8'd137))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd2;
									y_shrink=4'd1;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd2;
									y_shrink=4'd1;
									//if black
									end
								//y evalutes true
								end					
							else if ((y>8'd137)&&(y<8'd154))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd2;
									y_shrink=4'd2;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd2;
									y_shrink=4'd2;
									//if black
									end
								//y evalutes true
								end		
							else if ((y>8'd154)&&(y<8'd171))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd2;
									y_shrink=4'd3;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd2;
									y_shrink=4'd3;
									//if black
									end
								//y evalutes true
								end							
							else if  ((y>8'd171)&&(y<8'd188))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd2;
									y_shrink=4'd4;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd2;
									y_shrink=4'd4;
									//if black
									end
								//y evalutes true
								end							
							else if ((y>8'd188)&&(y<8'd222))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd2;
									y_shrink=4'd5;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd2;
									y_shrink=4'd5;
									//if black
									end
								//y evalutes true
								end			
							else if ((y>8'd222)&&(y<8'd240))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd2;
									y_shrink=4'd6;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd2;
									y_shrink=4'd6;
									//if black
									end
								//y evalutes true
								end		
							else if (y==8'd239)
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd2;
									y_shrink=4'd7;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd2;
									y_shrink=4'd7;
									//if black
									end
								//y evalutes true
								end													
					//x=2
					end

					else if ((x==9'd135))
					begin		
	
							 if ((y>8'd120)&&(y<8'd137))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd3;
									y_shrink=4'd1;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd3;
									y_shrink=4'd1;
									//if black
									end
								//y evalutes true
								end					
							else if ((y>8'd137)&&(y<8'd154))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd3;
									y_shrink=4'd2;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd3;
									y_shrink=4'd2;
									//if black
									end
								//y evalutes true
								end		
							else if ((y>8'd154)&&(y<8'd171))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd3;
									y_shrink=4'd3;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd3;
									y_shrink=4'd3;
									//if black
									end
								//y evalutes true
								end							
							else if  ((y>8'd171)&&(y<8'd188))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd3;
									y_shrink=4'd4;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd3;
									y_shrink=4'd4;
									//if black
									end
								//y evalutes true
								end							
							else if ((y>8'd188)&&(y<8'd222))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd3;
									y_shrink=4'd5;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd3;
									y_shrink=4'd5;
									//if black
									end
								//y evalutes true
								end			
							else if ((y>8'd222)&&(y<8'd240))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd3;
									y_shrink=4'd6;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd3;
									y_shrink=4'd6;
									//if black
									end
								//y evalutes true
								end		
							else if (y==8'd239)
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd3;
									y_shrink=4'd7;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd3;
									y_shrink=4'd7;
									//if black
									end
								//y evalutes true
								end													
					//x=3
					end
					
					else if ((x==9'd180))
					begin		

							 if ((y>8'd120)&&(y<8'd137))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd4;
									y_shrink=4'd1;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd0;
									y_shrink=4'd0;
									//if black
									end
								//y evalutes true
								end					
							else if ((y>8'd137)&&(y<8'd154))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd4;
									y_shrink=4'd2;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd4;
									y_shrink=4'd2;
									//if black
									end
								//y evalutes true
								end		
							else if ((y>8'd154)&&(y<8'd171))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd4;
									y_shrink=4'd3;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd4;
									y_shrink=4'd3;
									//if black
									end
								//y evalutes true
								end							
							else if  ((y>8'd171)&&(y<8'd188))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd4;
									y_shrink=4'd4;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd4;
									y_shrink=4'd4;
									//if black
									end
								//y evalutes true
								end							
							else if ((y>8'd188)&&(y<8'd222))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd4;
									y_shrink=4'd5;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd4;
									y_shrink=4'd5;
									//if black
									end
								//y evalutes true
								end			
							else if ((y>8'd222)&&(y<8'd240))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd4;
									y_shrink=4'd6;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd4;
									y_shrink=4'd6;
									//if black
									end
								//y evalutes true
								end		
							else if (y==8'd239)
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd4;
									y_shrink=4'd7;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd4;
									y_shrink=4'd7;
									//if black
									end
								//y evalutes true
								end													
					//x=4
					end


					else if ((x==9'd225))
					begin		
			
							 if ((y>8'd120)&&(y<8'd137))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd5;
									y_shrink=4'd1;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd5;
									y_shrink=4'd1;
									//if black
									end
								//y evalutes true
								end					
							else if ((y>8'd137)&&(y<8'd154))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd5;
									y_shrink=4'd2;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd5;
									y_shrink=4'd2;
									//if black
									end
								//y evalutes true
								end		
							else if ((y>8'd154)&&(y<8'd171))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd5;
									y_shrink=4'd3;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd5;
									y_shrink=4'd3;
									//if black
									end
								//y evalutes true
								end							
							else if  ((y>8'd171)&&(y<8'd188))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd5;
									y_shrink=4'd4;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd5;
									y_shrink=4'd4;
									//if black
									end
								//y evalutes true
								end							
							else if ((y>8'd188)&&(y<8'd222))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd5;
									y_shrink=4'd5;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd5;
									y_shrink=4'd5;
									//if black
									end
								//y evalutes true
								end			
							else if ((y>8'd222)&&(y<8'd240))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd5;
									y_shrink=4'd6;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd5;
									y_shrink=4'd6;
									//if black
									end
								//y evalutes true
								end		
							else if (y==8'd239)
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd5;
									y_shrink=4'd7;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd5;
									y_shrink=4'd7;
									//if black
									end
								//y evalutes true
								end													
					//x=5
					end


					else if ((x==9'd270))
					begin		
		
							 if ((y>8'd120)&&(y<8'd137))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd6;
									y_shrink=4'd1;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd6;
									y_shrink=4'd1;
									//if black
									end
								//y evalutes true
								end					
							else if ((y>8'd137)&&(y<8'd154))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd6;
									y_shrink=4'd2;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd6;
									y_shrink=4'd2;
									//if black
									end
								//y evalutes true
								end		
							else if ((y>8'd154)&&(y<8'd171))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd6;
									y_shrink=4'd3;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd6;
									y_shrink=4'd3;
									//if black
									end
								//y evalutes true
								end							
							else if  ((y>8'd171)&&(y<8'd188))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd6;
									y_shrink=4'd4;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd6;
									y_shrink=4'd4;
									//if black
									end
								//y evalutes true
								end							
							else if ((y>8'd188)&&(y<8'd222))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd6;
									y_shrink=4'd5;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd6;
									y_shrink=4'd5;
									//if black
									end
								//y evalutes true
								end			
							else if ((y>8'd222)&&(y<8'd240))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd6;
									y_shrink=4'd6;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd6;
									y_shrink=4'd6;
									//if black
									end
								//y evalutes true
								end		
							else if (y==8'd239)
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd6;
									y_shrink=4'd7;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd6;
									y_shrink=4'd7;
									//if black
									end
								//y evalutes true
								end													
					//x=6
					end
					
					else if ((x==9'd320))
					begin		
	
							 if ((y>8'd120)&&(y<8'd137))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd7;
									y_shrink=4'd1;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd7;
									y_shrink=4'd1;
									//if black
									end
								//y evalutes true
								end					
							else if ((y>8'd137)&&(y<8'd154))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd7;
									y_shrink=4'd2;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd7;
									y_shrink=4'd2;
									//if black
									end
								//y evalutes true
								end		
							else if ((y>8'd154)&&(y<8'd171))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd7;
									y_shrink=4'd3;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd7;
									y_shrink=4'd3;
									//if black
									end
								//y evalutes true
								end							
							else if  ((y>8'd171)&&(y<8'd188))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd7;
									y_shrink=4'd4;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd7;
									y_shrink=4'd4;
									//if black
									end
								//y evalutes true
								end							
							else if ((y>8'd188)&&(y<8'd222))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd7;
									y_shrink=4'd5;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd7;
									y_shrink=4'd5;
									//if black
									end
								//y evalutes true
								end			
							else if ((y>8'd222)&&(y<8'd240))
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd7;
									y_shrink=4'd6;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd7;
									y_shrink=4'd6;
									//if black
									end
								//y evalutes true
								end		
							else if (y==8'd239)
								begin	
								if (colour!=3'd0)
									begin
									state=1;
									x_shrink =4'd7;
									y_shrink=4'd7;	
									//if not black
									end
								else 
									begin
									state=0;
									x_shrink =4'd7;
									y_shrink=4'd7;
									//if black
									end
								//y evalutes true
							end													
					//x=7
					end
				//end of ratedivier

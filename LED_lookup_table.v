 
//////////////////////////////////////////////////Lookup Table to Drive LED Matrix////////////////////////////////////////////////////
		if (state == 1'b1) begin
		
				if((x_shrink == 4'd0)&& (y_shrink == 4'd0))
				  begin
					positive[0] =1'b1;
					negative[0] =1'b0;
				 end
			  
				 else if(((x_shrink == 4'd0))&& (y_shrink == 4'd1))
				  begin
			 positive[1] =1'b1;
					negative[0] =1'b0;
				 end
		  
				 if(((x_shrink == 4'd0))&& (y_shrink == 4'd2))
				  begin
			 positive[3] =1'b1;
					negative[0] =1'b0;
				 end
			
				 if(((x_shrink == 4'd0))&& (y_shrink == 4'd3))
				  begin
			 positive[5] =1'b1;
					negative[0] =1'b0;
				 end
			 
				 if(((x_shrink == 4'd0))&& (y_shrink == 4'd4))
				  begin
			 positive[7] =1'b1;
					negative[0] =1'b0;
				 end
			 
				 if(((x_shrink == 4'd0))&& (y_shrink == 4'd5))
				  begin
			 positive[9] =1'b1;
					negative[0] =1'b0;
				 end
			  
				 if((x_shrink == 4'd0)&& (y_shrink == 4'd6))
				  begin
			 positive[11] =1'b1;
					negative[0] =1'b0;
				 end
		  
				 if((x_shrink == 4'd0)&& (y_shrink == 4'd7))
				  begin
			 positive[13] =1'b1;
					negative[0] =1'b0;
				 end




				 if((x_shrink == 4'd1)&&(y_shrink==4'd0))
				  begin
				  
					positive[0]=1'b1;
					negative[1]=1'b0;
				 end
			
				 if((x_shrink == 4'd1)&& (y_shrink == 4'd1))
				  begin
				   //positive[0] = 1'b1;
					negative[0] = 1'b0;
					//positive[1] =1'b1;
					positive = 14'b00000000000011;
					negative[1] =1'b0;
				 end
		  
				 if((x_shrink == 4'd1)&& (y_shrink == 4'd2))
				  begin
				   // positive[0] = 1'b1;
					negative[0] = 1'b0;
					//positive[1] =1'b1;
					negative[1] =1'b0;
			// positive[3] =1'b1;
			positive = 14'b00000000000111;
					negative[3] =1'b0;
				 end
		  
				 if((x_shrink == 4'd1)&& (y_shrink == 4'd3))
				  begin
			 		positive[5] =1'b1;
					negative[1] =1'b0;
				 end
			
				 if((x_shrink == 4'd1)&& (y_shrink == 4'd4))
				  begin
					 positive[7] =1'b1;
					negative[1] =1'b0;
				 end
			 
				 if((x_shrink == 4'd1)&& (y_shrink == 4'd5))
				  begin
					 positive[9] =1'b1;
					negative[1] =1'b0;
				 end
			
				 if((x_shrink == 4'd1)&& (y_shrink == 4'd6))
				  begin
					 positive[11] =1'b1;
					negative[1] =1'b0;
				 end
			 
				 if((x_shrink == 4'd1)&& (y_shrink == 4'd7))
				  begin
					 positive[13] =1'b1;
					negative[1] =1'b0;
				 end


			 if((x_shrink == 4'd2)&& (y_shrink == 4'd0))
				  begin
					 positive[0] =1'b1;
					negative[3] =1'b0;
				 end

				 if((x_shrink == 4'd2)&& (y_shrink == 4'd1))
				  begin
					 positive[1] =1'b1;
					negative[3] =1'b0;
				 end
			 
				 if((x_shrink == 4'd2)&& (y_shrink == 4'd2))
				  begin
					 positive[3] =1'b1;
					negative[3] =1'b0;
				 end
			
				 if((x_shrink == 4'd2)&& (y_shrink == 4'd3))
				  begin
					 positive[5] =1'b1;
					negative[3] =1'b0;
				 end
			 
				 if((x_shrink == 4'd2)&& (y_shrink == 4'd4))
				  begin
					 positive[7] =1'b1;
					negative[3] =1'b0;
				 end
			 
				 if((x_shrink == 4'd2)&& (y_shrink == 4'd5))
				  begin
			 		positive[9] =1'b1;
					negative[3] =1'b0;
				 end
			  
				 if((x_shrink == 4'd2)&& (y_shrink == 4'd6))
				  begin
					 positive[11] =1'b1;
					negative[3] =1'b0;
				 end
			 
				 if((x_shrink == 4'd2)&& (y_shrink == 4'd7))
				  begin
					 positive[13] =1'b1;
					negative[3] =1'b0;
				 end


			if((x_shrink == 4'd3)&& (y_shrink == 4'd0))
				  begin
					 positive[0] =1'b1;
					negative[5] =1'b0;
				 end
			 
				 if((x_shrink == 4'd3)&& (y_shrink == 4'd1))
				  begin
			 		positive[1] =1'b1;
					negative[5] =1'b0;
				 end
		  
				 if((x_shrink == 4'd3)&& (y_shrink == 4'd2))
				  begin
					 positive[3] =1'b1;
					negative[5] =1'b0;
				 end
			
				 if((x_shrink == 4'd3)&& (y_shrink == 4'd3))
				  begin
					 positive[5] =1'b1;
					negative[5] =1'b0;
				 end
			  
				 if((x_shrink == 4'd3)&& (y_shrink == 4'd4))
				  begin
					 positive[7] =1'b1;
					negative[5] =1'b0;
				 end
			  
				 if((x_shrink == 4'd3)&& (y_shrink == 4'd5))
				  begin
					 positive[9] =1'b1;
					negative[5] =1'b0;
				 end
			
				 if((x_shrink == 4'd3)&& (y_shrink == 4'd6))
				  begin
					 positive[11] =1'b1;
					negative[5] =1'b0;
				 end
			  
				 if((x_shrink == 4'd3)&& (y_shrink == 4'd7))
				  begin
			 		positive[13] =1'b1;
					negative[5] =1'b0;
				 end
			

			if((x_shrink == 4'd4)&& (y_shrink == 4'd0))
				  begin
			 		positive[0] =1'b1;
					negative[7] =1'b0;
				 end
			
				 if((x_shrink == 4'd4)&& (y_shrink == 4'd1))
				  begin
			 		positive[1] =1'b1;
					negative[7] =1'b0;
				 end
			
				 if((x_shrink == 4'd4)&& (y_shrink == 4'd2))
				  begin
			 		positive[3] =1'b1;
					negative[7] =1'b0;
				 end
			  
				 if((x_shrink == 4'd4)&& (y_shrink == 4'd3))
				  begin
			 		positive[5] =1'b1;
					negative[7] =1'b0;
				 end
			 
				 if((x_shrink == 4'd4)&& (y_shrink == 4'd4))
				  begin
			 		positive[7] =1'b1;
					negative[7] =1'b0;
				 end
				
				 if((x_shrink == 4'd4)&& (y_shrink == 4'd5))
				  begin
			 		positive[9] =1'b1;
					negative[7] =1'b0;
				 end
			
				 if((x_shrink == 4'd4)&& (y_shrink == 4'd6))
				  begin
			 		positive[11] =1'b1;
					negative[7] =1'b0;
				 end
			 
				 if((x_shrink == 4'd4)&& (y_shrink == 4'd7))
				  begin
			 		positive[13] =1'b1;
					negative[7] =1'b0;
				 end

					


			if((x_shrink == 4'd5)&& (y_shrink == 4'd0))
				  begin
			 		positive[0] =1'b1;
					negative[9] =1'b0;
				 end
			 
				 if((x_shrink == 4'd5)&& (y_shrink == 4'd1))
				  begin
			 		positive[1] =1'b1;
					negative[9] =1'b0;
				 end
			 
				 if((x_shrink == 4'd5)&& (y_shrink == 4'd2))
				  begin
			 		positive[3] =1'b1;
					negative[9] =1'b0;
				 end
			
				 if((x_shrink == 4'd5)&& (y_shrink == 4'd3))
				  begin
			 		positive[5] =1'b1;
					negative[9] =1'b0;
				 end
			  
				 if((x_shrink == 4'd5)&& (y_shrink == 4'd4))
				  begin
			 		positive[7] =1'b1;
					negative[9] =1'b0;
				 end
			  
				 if((x_shrink == 4'd5)&& (y_shrink == 4'd5))
				  begin
			 		positive[9] =1'b1;
					negative[9] =1'b0;
				 end
			
				 if((x_shrink == 4'd5)&& (y_shrink == 4'd6))
				  begin
			 		positive[11] =1'b1;
					negative[9] =1'b0;
				 end
				
				 if((x_shrink == 4'd5)&& (y_shrink == 4'd7))
				  begin
			 		positive[13] =1'b1;
					negative[9] =1'b0;
				 end



			
			if((x_shrink == 4'd6)&& (y_shrink == 4'd0))
				  begin
					 positive[0] =1'b1;
					negative[11] =1'b0;
				 end
				
				 if((x_shrink == 4'd6)&& (y_shrink == 4'd1))
				  begin
			 		positive[1] =1'b1;
					negative[11] =1'b0;
				 end
				 
				 if((x_shrink == 4'd6)&& (y_shrink == 4'd2))
				  begin
					 positive[3] =1'b1;
					negative[11] =1'b0;
				 end
				begin
				 if((x_shrink == 4'd6)&& (y_shrink == 4'd3))
				  begin
			 		positive[5] =1'b1;
					negative[11] =1'b0;
				 end
				 
				 if((x_shrink == 4'd6)&& (y_shrink == 4'd4))
				  begin
			 		positive[7] =1'b1;
					negative[11] =1'b0;
				 end
				
				 if((x_shrink == 4'd6)&& (y_shrink == 4'd5))
				  begin
			 		positive[9] =1'b1;
					negative[11] =1'b0;
				 end
				 
				 
				 
				 if((x_shrink == 4'd6)&& (y_shrink == 4'd6))
				  begin
			 		positive[11] =1'b1;
					negative[11] =1'b0;
				 end
				 
				 
				 if((x_shrink == 4'd6)&& (y_shrink == 4'd7))
				  begin
			 		positive[13] =1'b1;
					negative[11] =1'b0;
				 end



			
			if((x_shrink == 4'd7)&& (y_shrink == 4'd0))
				  begin
			 		positive[0] =1'b1;
					negative[13] =1'b0;
				 end
				
				 
				 
				 if((x_shrink == 4'd7)&& (y_shrink == 4'd1))
				  begin
			 		positive[1] =1'b1;
					negative[13] =1'b0;
				 end
				
				 
				 
				 if((x_shrink == 4'd7)&& (y_shrink == 4'd2))
				  begin
			 		positive[3] =1'b1;
					negative[13] =1'b0;
				 end
				 
				 
				 
				 if((x_shrink == 4'd7)&& (y_shrink == 4'd3))
				  begin
			 		positive[5] =1'b1;
					negative[13] =1'b0;
				 end
			  
				 
				 
				 if((x_shrink == 4'd7)&& (y_shrink == 4'd4))
				  begin
			 		positive[7] =1'b1;
					negative[13] =1'b0;
				 end
				 
				 
			
				 if((x_shrink == 4'd7)&& (y_shrink == 4'd5))
			 		positive[9] =1'b1;
					negative[13] =1'b0;
				 end
				
				 
				 if((x_shrink == 4'd7)&& (y_shrink == 4'd6))
				  begin
			 		positive[11] =1'b1;
					negative[13] =1'b0;
				 end
			  
				 
				 
				 if((x_shrink == 4'd7)&& (y_shrink == 4'd7))
				  begin
					positive[13] =1'b1;
					negative[13] =1'b0;
				 end
          			      count = 0;
			end
			



else 
				 begin
					positive = 14'd0;
					negative = 14'd0;	 
				 end
			end
		else 
begin
			count = count +1;
		end
			
//posedge clock	
end

endmodule

module car_parking (register, gl_reset, car_exit, exit_from, exit_code,car_arrival, available_slots,can_park, g_led,r_led,temp,enable);

  input gl_reset;
  input car_arrival, car_exit;
  input [2:0]exit_from;
  input [7:0] exit_code;
  input enable;
  
  output reg [2:0] available_slots;
  output reg can_park;
  output reg [7:1] register;
  reg [7:0]ooo,ool,olo,oll,loo,lol,llo,lll;
  output wire g_led,r_led;
  
  reg [2:0] spot;
  output reg [7:0] temp;
  reg match;
  reg red_tmp=1'b0;
  reg green_tmp=1'b0;
  
  integer i;
  
  assign r_led = red_tmp  ;
  assign g_led = green_tmp;

  always @(posedge enable)
  begin

    if (gl_reset)
    begin
      available_slots <= 3'b111;
      register <= 0;
      can_park <= 1;
    end
    else if (available_slots==0)
    begin
      can_park <= 0;
    end
    else if (car_arrival)
    begin
      can_park <= 1;
      available_slots <= available_slots - 1; 
      for (i=1;i<=7;i = i+1)
      begin
        if (register [i]==0)
        begin
          spot = i;
        end
      end

      register [spot] <= 1;

      case (spot)
        3'b111: temp =1+2+3+5+8+13+21+34;
        3'b110: temp =1+2+3+5+8+13+21;
        3'b101: temp =1+2+3+5+8+13;
        3'b100: temp =1+2+3+5+8;
        3'b011: temp =1+2+3+5;
        3'b010: temp =1+2+3;
        3'b001: temp =1+2;
      endcase
      
      begin
        assign lll =1+2+3+5+8+13+21+34;
        assign llo =1+2+3+5+8+13+21;
        assign lol =1+2+3+5+8+13;
        assign loo =1+2+3+5+8;
        assign oll =1+2+3+5;
        assign olo =1+2+3;
        assign ool =1+2;
        
        $display("\npasscode for entered vehicle %b",temp);
      end
    end
    if (car_exit && register[exit_from]==0)
    $display("\nwrong information about exit from");
    if (car_exit && register[exit_from]==1)
    begin
      temp=8'bx;
      case (exit_from)

      7:begin
      if (exit_code == lll) match =1;
      else match = 0;
      end

      6:begin
      if (exit_code==llo) match =1;
      else match=0;
      end

      5:begin
      if (exit_code== lol) match =1;
      else match = 0;
      end

      4:begin
      if (exit_code== loo) match =1;
      else match = 0;
      end

      3: begin
      if (exit_code==oll) match =1;
      else match = 0;
      end

      2: begin
      if (exit_code ==olo) match =1;
      else match = 0;
      end

      1: begin
      if (exit_code==ool) match =1;
      else match = 0;
      end

    endcase

    if (match)
    begin
      green_tmp = 1'b1;
      red_tmp = 1'b0;
      can_park <= 1;

      if(available_slots!=7)
      begin
        available_slots <= available_slots + 1; 
        temp=8'bx;
      end
      register [exit_from] <= 0; 
    end

    else
    begin
      green_tmp = 1'b0;
      red_tmp = 1'b1;
      #1 $display("password is incorrect");
    end
  end

end
endmodule

module car_parkingtb;

  reg gl_reset;
  reg car_arrival;
  reg car_exit;
  reg [2:0]exit_from;
  reg [7:0]exit_code;
  wire [2:0]available_slots;
  wire can_park; 
  wire g_led,r_led;
  wire [7:1]register;
  wire [7:0]temp;
  reg enable;
 

  car_parking car_parkinginst(.register(register),.gl_reset(gl_reset),.car_exit(car_exit),.exit_from(exit_from),.exit_code(exit_code),.car_arrival(car_arrival),.available_slots(available_slots),.can_park(can_park),.g_led(g_led),.r_led(r_led),.enable(enable),.temp(temp));
  initial 
    begin
    
    enable=0;
    #100
    enable<=1;
    gl_reset=1;
    #50 $display("available slots: %d, can park: %b,gled: %b, rled:%btemp:%b",available_slots, can_park,g_led,r_led,temp);
    
    enable=0;
    #100
    enable<=1;
    gl_reset=0;
    car_arrival<=1'b1;
    car_exit<=1'b0;
    exit_from<=1'b0;
    exit_code<=1'b0;     
    #50 $display("available slots %d, can park: %b,gled: %b, rled:%btemp:%b",available_slots, can_park,g_led,r_led,temp);
    
    enable=0;
    #100
    enable<=1;
    gl_reset=0;
    car_arrival<=1'b1;
    car_exit<=1'b0;
    exit_from<=1'b0;
    exit_code<=1'b0;     
    #50 $display("available slots %d, can park: %b,gled: %b, rled:%btemp:%b",available_slots, can_park,g_led,r_led,temp);
    
    enable=0;
    #100
    enable<=1;
    gl_reset=0;
    car_arrival<=1'b1;
    car_exit<=1'b0;
    exit_from<=1'b0;
    exit_code<=1'b0;     
    #50 $display("available slots %d, can park: %b,gled: %b, rled:%btemp:%b",available_slots, can_park,g_led,r_led,temp);
    
    enable=0;
    #100
    enable<=1;
    gl_reset=0;
    car_arrival<=1'b1;
    car_exit<=1'b0;
    exit_from<=1'b0;
    exit_code<=1'b0;     
    #50 $display("available slots %d, can park: %b,gled: %b, rled:%btemp:%b",available_slots, can_park,g_led,r_led,temp);
    
    enable=0;
    #100
    enable<=1;
    gl_reset=0;
    car_arrival<=1'b1;
    car_exit<=1'b0;
    exit_from<=1'b0;
    exit_code<=1'b0;     
    #50 $display("available slots %d, can park: %b,gled: %b, rled:%btemp:%b",available_slots, can_park,g_led,r_led,temp);
    
    enable=0;
    #100
    enable<=1;
    gl_reset=0;
    car_arrival<=1'b1;
    car_exit<=1'b0;
    exit_from<=1'b0;
    exit_code<=1'b0;     
    #50 $display("available slots %d, can park: %b,gled: %b, rled:%btemp:%b",available_slots, can_park,g_led,r_led,temp);
    
    enable=0;
    #100
    enable<=1;
    gl_reset=0;
    car_arrival<=1'b1;
    car_exit<=1'b0;
    exit_from<=1'b0;
    exit_code<=1'b0;     
    #50 $display("available slots %d, can park: %b,gled: %b, rled:%btemp:%b",available_slots, can_park,g_led,r_led,temp);
    
    enable=0;
    #100
    enable<=1;
    gl_reset=0;
    car_arrival<=1'b1;
    car_exit<=1'b0;
    exit_from<=1'b0;
    exit_code<=1'b0;     
    #50 $display("available slots %d, can park: %b,gled: %b, rled:%btemp:%b",available_slots, can_park,g_led,r_led,temp);
    
    enable=0;
    #100
    enable<=1;
    gl_reset=0;
    car_arrival<=1'b1;
    car_exit<=1'b0;
    exit_from<=1'b0;
    exit_code<=1'b0;     
    #50 $display("available slots %d, can park: %b,gled: %b, rled:%btemp:%b",available_slots, can_park,g_led,r_led,temp);
    
    
    enable=0;
    #100 enable<=1;
    gl_reset=0;
    car_arrival=1'b0;
    car_exit=1'b1;
    exit_from=3'b110;
    exit_code=8'b00110101;
    #50 $display("available slots %d, can park: %b,gled: %b, rled:%b,temp %b",available_slots, can_park,g_led,r_led,temp);
    
    enable=0;
    #100 enable<=1;
    gl_reset=0;
    car_arrival=1'b0;
    car_exit=1'b1;
    exit_from=3'b110;
    exit_code=8'b00110101;
    #50 $display("available slots %d, can park: %b,gled: %b, rled:%b,temp %b",available_slots, can_park,g_led,r_led,temp);
  end
  initial 
    begin
    $dumpfile("fa.vcd");
    $dumpvars;
  end
endmodule
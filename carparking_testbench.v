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
module car_parking (register, gl_reset, car_exit, exit_from, exit_code,car_arrival, available_slots,can_park, g_led,r_led,temp,enable);

  input gl_reset;//global reset
  input car_arrival, car_exit;//pulse when car arrives or exits
  input [2:0]exit_from;//the spot from which car is exiting
  input [7:0] exit_code;//entering the passscode from the exiting spot
  input enable;
  
  output reg [2:0] available_slots;//how many slots are available
  output reg can_park;//1 if there slot available for parking, 0 if there is not
  output reg [7:1] register;//temporary memory to remember the spot where cars are parked
  output reg [7:0] temp;//holding the passcodes for designated spots
  output wire g_led,r_led;
  
  reg [2:0] spot;//car has been allowed to exit 
  reg [7:0]ooo,ool,olo,oll,loo,lol,llo,lll;//memories to hold the passcodes for each spot 
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
    
    else if (available_slots==0)//if no slots available, car cannot be parked
    begin
      can_park <= 0;
    end
    
    else if (car_arrival)//if a car arrives and the former two conditions are not met
    begin//this will execute
      can_park <= 1;
      available_slots <= available_slots - 1; //number of slots will decrease by 1
      for (i=1;i<=7;i = i+1)//the for loop will check for MSB in register variable that is zero 
      //and then will park the car in that spot
      begin
        if (register [i]==0)
        begin
          spot = i;
        end
      end

      register [spot] <= 1;//where the car is parked

      case (spot)
        3'b111: temp =1+2+3+5+8+13+21+34;
        3'b110: temp =1+2+3+5+8+13+21;
        3'b101: temp =1+2+3+5+8+13;
        3'b100: temp =1+2+3+5+8;
        3'b011: temp =1+2+3+5;
        3'b010: temp =1+2+3;
        3'b001: temp =1+2;
      endcase
      //generating passcode for each slots, according to fibonacci sequence
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
    if (car_exit && register[exit_from]==0)//this will execute is there is a pulse in car_exit variable
    $display("\nwrong information about exit from");
    if (car_exit && register[exit_from]==1)
    begin//find the number from which the car is exiting, and check if the code input from
      temp=8'bx;//exit_code matches the proper case
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
    begin//if there is a match in the code given and the passcode, this will emit green light
      green_tmp = 1'b1;
      red_tmp = 1'b0;
      can_park <= 1;

      if(available_slots!=7)//increase the number of available spots
      begin//if a car exits, the slot becomes available for parking 
        available_slots <= available_slots + 1; 
        temp=8'bx;
      end
      register [exit_from] <= 0; //putting zero in that slot of the register to denote it's
    end
    //if the exit_code doesn't match the passcode, the car will not be exit
    else
    begin
      green_tmp = 1'b0;
      red_tmp = 1'b1;
      #1 $display("password is incorrect");
    end
  end

end
endmodule

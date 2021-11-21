Team-Members:

M.N.S.M.S.Vishnu (2020CSB1097) 
D.V.S.Lasyanth (2020CSB1083)

Title: Car Parking System(for parking slots of 7 cars).

Inputs: 
car_arrival     Updating whether car has came or not.
car_exit-       Updating whether car has departed or not.
exit_from       Position from which car has departed.
exit_code       Passcode of the position from which car has departed.
gl_reset        Reset to clear all cars in parking slot.

outputs         
available_slots Total no of vacancies available in the parking slot.
can_park        This will determine whether the parking slot is fully occupied or not.
g_led,r_led     Led's for determining wrong and right passwards.
temp            Passcode generated for that position.

Functionalities
1)Using this code, we can securely make the movement of cars using password verification
2)using this code we can be able to monitor total number of vacancies and their locations
3)using this code,we can easily create vacancies and fill them 

working
1)we will check the availability status and verify the can_park for vacancy to fill and assign a location to this vehicle along with passcode for verification.passwords are created using fibonacci series.
2)while the exit of the vehicle,we will check the passcodes and allow the vehicle to move if password is correct,we also indicate them using lights for better security.It will also notifywhen there is wrong information.

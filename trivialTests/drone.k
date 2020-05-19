
module DRONE-SYNTAX
  imports DOMAINS-SYNTAX

  syntax BeforeMove ::= "takeoff"
  syntax FinishMove ::= "land"
  syntax Action  ::= Int 
                   | "forward"
                   | "backward"


  syntax Pgm ::= "takeoff" ";" Movements ";" "land"

  syntax Movements ::= Int | List{Action,","}

  syntax KResult ::= Action | Movements 
                  
endmodule


module DRONE
  imports DOMAINS
  imports DRONE-SYNTAX

  configuration <T color="yellow">
                  <k color="green"> $PGM:Pgm </k>
                  <state color="red"> 0 </state>
                </T>

  //rule I1:Int , I2:Int => I1 +Int I2

  rule <k> takeoff ; Moves ; land => Moves </k> 

  rule <k> forward , Xs => 1 , Xs </k> <state> T => T +Int 1 </state>
  rule <k> I1:Int , forward , Xs => I1 +Int 1 , Xs </k> <state> T => T +Int 1 </state>
  rule <k> I1:Int , forward => I1 +Int 1 </k> <state> T => T +Int 1 </state>

  rule <k> backward , Xs => (-1) , Xs </k> 
  rule <k> I1:Int , backward , Xs => I1 +Int -1 , Xs </k> 
  rule <k> I1:Int , backward => I1 +Int -1 </k> 

endmodule

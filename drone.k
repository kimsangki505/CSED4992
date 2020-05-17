
module DRONE-SYNTAX
  imports DOMAINS-SYNTAX

  syntax BeforeMove ::= "takeoff"
  syntax FinishMove ::= "land"
  syntax Action  ::= "forward"
                   | "backward"
                   | "left"
                   | "right"
  
  syntax Movements ::= List{Action,","}

  syntax Pgm ::= "takeoff" ";" Movements ";" "land"

  syntax KResult ::= Exp
  syntax Exp ::= Int | Exp "+" Exp

  //syntax Position ::= Int 
  //                  | "takeoff" ";" Action
  //                  | "forward" "," Action
                  
endmodule


module DRONE
  imports DOMAINS
  imports DRONE-SYNTAX

  configuration <T color="yellow">
                  <k color="green"> $PGM:Pgm </k>
                  <state color="red"> .Map </state>
                </T>

 
  rule I1 + I2 => I1 +Int I2

  //rule "forward" "," AC1 => 1 +Int AC1
  //rule "forward" ","  => 1 +Int AC1

  rule  <k>takeoff ; (X, Xs => Xs) ; land </k>

  rule  <k>takeoff ; .Movements ; land => "Success" </k>

  //rule .Movements => .  [structural]

endmodule

    
module DRONE-SYNTAX
  imports DOMAINS-SYNTAX
  
  syntax Pgm ::= Stmt

  syntax Movement ::= "forward" Int
                    | "backward" Int
                    | "lt" Int
                    | "rt" Int
                    | "up" Int
                    | "down" Int
                    | "takeoff"
                    | "land"
                    | "Hovering"
                    > Movement "," Movement  [left]

  syntax AExp  ::= Int | Id

  syntax BExp  ::= Bool
                 | AExp "<=" AExp             [seqstrict] 

  syntax Block ::= "{" "}"
                 | "{" Stmt "}"

  syntax Stmt  ::= Movement
                 //| "if" "(" BExp ")" "then" Block "else" Block "fi" [strict(1)]
                 //| "while" "(" BExp ")" "loop" Block "pool"
                 > Stmt Stmt                                        [left]

endmodule


module DRONE
  imports DOMAINS
  imports DRONE-SYNTAX

  syntax KResult ::= Int | Bool

  configuration <T color="yellow">
                  <k color="green"> $PGM:Pgm </k>
                  <xPos color="white"> 0 </xPos>
                  <yPos color="white"> 0  </yPos>
                </T>


  rule S1:Stmt S2:Stmt => S1 ~> S2  [structural]

  rule M1:Movement , M2:Movement => M1 ~> M2 [structural]
 
  rule takeoff => .
endmodule
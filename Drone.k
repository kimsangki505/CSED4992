module DRONE-SYNTAX
  imports DOMAINS-SYNTAX

  syntax Program ::= "limitSpeed" "=" Int ";" "limitHeight" "=" Int ";" Exprs
  
  syntax Direction ::= "Forward" | "Backward" | "Left" | "Right" | "Up" | "Down"

  syntax Movement ::= Direction Int
                    | "takeoff"
                    | "land"
                    | "Hovering"

  syntax Movements ::= List{Movement,","}

  syntax Expr ::= Id "=" Expr
                | "if" "then" "else" "fi"
                | "while" " loop" "pool"
                | Movements
                | "readSensor" "(" ")"
                | Int
                | Bool

  syntax Exprs ::= List{Expr,""}
                  
endmodule


module DRONE
  imports DOMAINS
  imports DRONE-SYNTAX

endmodule

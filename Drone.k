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
                | "if" Expr "then" Expr "else" Expr "fi"
                | "while" Expr " loop" Expr "pool"
                | Movements
                | "readSensor" "(" ")"
                | Int
                | Bool

  syntax Exprs ::= List{Expr,""}
                  
endmodule


module DRONE
  imports DOMAINS
  imports DRONE-SYNTAX



  configuration <T color="yellow">
                  <k color="green"> $PGM:Program </k>
                  <bump color="red"> 0 </bump>
                  <ls color="magenta"> 0 </ls>
                  <lh color="magenta"> 0 </lh>
                  <xPos color="white"> 0 </xPos>
                  <yPos color="white"> 0  </yPos>
                  <xSpeed color="blue"> 0  </xSpeed>
                  <ySpeed color="blue"> 0 </ySpeed>
                  <xAcc color="orange"> 0 </xAcc>
                  <yAcc color="orange"> 0 </yAcc>
                </T>

endmodule

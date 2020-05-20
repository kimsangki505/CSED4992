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
                | "if" CombinationBool "then" Expr "else" Expr "fi" [strict(1)]
                | "while" CombinationBool " loop" Expr "pool"       [strict(1)]
                | Movements
                | "readSensor" "(" ")"
                | Id
                | Int
  
  syntax BoolExp ::= Expr "<" Expr          [strict]
                   | Expr ">" Expr          [strict]
                   | Expr "<=" Expr         [strict]
                   | Expr ">=" Expr         [strict]
                   | Expr "==" Expr         [strict]
                   | Bool

  syntax CombinationBool ::= BoolExp
                         | BoolExp "and" CombinationBool 
                         | BoolExp "or" CombinationBool
                         | Bool

  

  syntax Exprs ::= List{Expr," "}
  
  syntax KResult ::= Int | Bool

endmodule


module DRONE
  imports DOMAINS
  imports DRONE-SYNTAX

  configuration <T color="yellow">
                  <k color="green"> $PGM:Program </k>
                  <takeoffAndLand> false </takeoffAndLand>
                  <bump color="red"> false </bump>
                  <limitspeed color="magenta"> 0 </limitspeed>
                  <limitheight color="magenta"> 0 </limitheight>
                  <xPos color="white"> 0 </xPos>
                  <yPos color="white"> 0  </yPos>
                  <xSpeed color="blue"> 0  </xSpeed>
                  <ySpeed color="blue"> 0 </ySpeed>
                  <xAcc color="orange"> 0 </xAcc>
                  <yAcc color="orange"> 0 </yAcc>
                </T>


  rule <k> limitSpeed = LS ; limitHeight = LH ; Exprs => Exprs </k>
endmodule
 
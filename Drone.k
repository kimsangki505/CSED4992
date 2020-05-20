module DRONE-SYNTAX
  imports DOMAINS-SYNTAX

  syntax Program ::= "limitSpeed" "=" Int ";" "limitHeight" "=" Int ";" Expr
  
  syntax Direction ::= "forward" | "backward" | "left" | "right" | "up" | "down"

  syntax Movement ::= Direction Int
                    | "takeoff"
                    | "land"
                    | "Hovering"

  syntax Movments ::= Movement | Movement "," Movments

  syntax Expr ::= Movments 
                | Expr "<" Expr          [strict]
                | Expr ">" Expr          [strict]
                | Expr "<=" Expr         [strict]
                | Expr ">=" Expr         [strict]
                | Expr "==" Expr         [strict]
                | Int
                | Bool

  
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


  rule <k> limitSpeed = LS ; limitHeight = LH ; Exs => Exs </k>
       <limitspeed> 0 => LS </limitspeed>
       <limitheight> 0 => LH </limitheight>


  rule I1 <= I2 => I1 <=Int I2
  rule I1 <= I2 => I1 <=Int I2
  rule I1 <= I2 => I1 <=Int I2
  rule I1 <= I2 => I1 <=Int I2
  rule I1 <= I2 => I1 <=Int I2
  rule I1 <= I2 => I1 <=Int I2

endmodule
 
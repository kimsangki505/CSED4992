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

  

  syntax Exprs ::= List{Expr,""}
  
  syntax KResult ::= Int | Bool

endmodule


module DRONE
  imports DOMAINS
  imports DRONE-SYNTAX


/*
  configuration <T color="yellow">
                  <k color="green"> $PGM:Program </k>
                  <bump color="red"> false </bump>
                  <ls color="magenta"> 0 </ls>
                  <lh color="magenta"> 0 </lh>
                  <xPos color="white"> 0 </xPos>
                  <yPos color="white"> 0  </yPos>
                  <xSpeed color="blue"> 0  </xSpeed>
                  <ySpeed color="blue"> 0 </ySpeed>
                  <xAcc color="orange"> 0 </xAcc>
                  <yAcc color="orange"> 0 </yAcc>
                </T>


  rule <k> limitSpeed = Int ; limitHeight = Int ; Exprs </k>

  rule I1 * I2 => I1 *Int I2
  rule I1 / I2 => I1 /Int I2
  rule I1 + I2 => I1 +Int I2
  rule I1 <= I2 => I1 <=Int I2

  rule <k> Forward Acc </k>
  rule <k> Backward Acc </k>
  rule <k> Left Acc </k>
  rule <k> Right Acc </k>
  rule <k> Up Acc </k>
  rule <k> Down Acc </k>

  rule <k> takeoff </k>
  rule <k> land </k>
  rule <k> Hovering </k>

  rule <k> M1:Movement , M2:Movement </k>
  rule <k> .Movements </k>

  rule <k> E1:Expr E2:Expr </k>
  rule <k> .Exprs </k>

  rule <k> X = Expr </k> 

  rule <k> if true then expr1 else expr2 fi </k> 
  rule <k> if false then expr1 else expr2 fi </k>

  rule <k> while true loop Expr pool </k>
  rule <k> while false loop Expr pool </k>

  
                | "readSensor" "(" ")"
  
*/
endmodule
 
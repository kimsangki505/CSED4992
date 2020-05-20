    
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
                 | "read" "(" ")"
                 | "-" Int
                 > AExp "+" AExp              [left, strict]

  syntax BExp  ::= Bool
                 | AExp "<=" AExp             [seqstrict] 

  syntax Block ::= "{" "}"
                 | "{" Stmt "}"

  syntax Stmt  ::= Block
                 | Id "=" AExp ";" [strict(2)]
                 | Movement ";"
                 | "if" "(" BExp ")"  Block "else" Block [strict(1)]
                 | "while" "(" BExp ")" Block 
                 | "var" Ids ";"
                 > Stmt Stmt                                        [left]

  syntax Ids   ::= List{Id,","}

endmodule


module DRONE
  imports DOMAINS
  imports DRONE-SYNTAX

  syntax KResult ::= Int | Bool

  configuration <T color="yellow">
                  <k color="green"> $PGM:Pgm </k>
                  <env color="LightSkyBlue"> .Map </env>
                  <store color="red"> .Map </store>
                  <input color="magenta" stream="stdin"> .List </input>
                </T>

  //Movement
  rule  M1:Movement , M2:Movement => M1 ~> M2

  rule takeoff  => .
  rule takeoff => .
  rule Hovering => .
  rule land => .

  rule forward N:Int => .
  rule backward N:Int => .
  rule lt N:Int => .
  rule rt N:Int => .
  rule up N:Int => .
  rule down N:Int => .

  //AExp
  rule <k> X:Id => I ...</k>
       <env>... X |-> N ...</env>
       <store>... N |-> I ...</store>  [lookup]

  rule <k> read() => I ...</k>
       <input> ListItem(I:Int) => .List ...</input>

  rule I1 + I2 => I1 +Int I2
  rule - I => 0 -Int I


  //BExp
  rule I1 <= I2 => I1 <=Int I2

  //Block
  rule {} => .   [structural]
  rule <k> {S} => S ~> Rho ...</k> <env> Rho </env>  [structural]
  rule <k> Rho => . ...</k> <env> _ => Rho </env>    [structural]


  //stmt
  rule S1:Stmt S2:Stmt => S1 ~> S2  [structural]

  rule <k> X = I:Int; => . ...</k>
       <env>... X |-> N ...</env>
       <store>... N |-> (_ => I) ...</store>

  rule if (true) S else _  => S
  rule if (false) _ else S => S

  rule while (B) S => if (B) {S while (B) S} else {} [structural]


  rule <k> var (X,Xs => Xs); ...</k>
       <env> Rho => Rho[X <- !N:Int] </env>
       <store>... .Map => !N |-> 0 ...</store>

  rule var .Ids; => .  [structural]

endmodule
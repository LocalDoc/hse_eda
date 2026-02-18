#show heading: set align(center)
= Макроэкономика 
=== Лекция 8
=== 
=== Экономика и Анализ Данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()
#show heading: set align(left)



$
cases(
  (1 - alpha) dot Y  = A_0 + I'_R dot R, 
  m^d'_y dot Y + m^d'_R dot R  = M/P
)
==> 
cases(
  (1-alpha) delta Y = delta A_0 + I'R dot delta R, 
  m^d'_Y dot Y + m^d'_R dot delta R = (delta M)/P 
)
$

Матрица чувствительности:

$
  mat(
    1- alpha, -I'_R; 
    m^d'_Y, m^d'_R 
  )
  dot 
  mat(
    delta Y;
    delta R 
  )
  = 
  mat(
    delta A_0;
    (delta M)/P
  ) 
  ==>
  delta A_0 = delta (C_0 - "mpc" T_0 + I_0 + G_0 + "NX"_0)


$

*Рассмотрим три варианта политики: *

Состояние равновестного бюджета.
$
 delta G = delta T_0 ("при" delta M = 0) ==>  delta A_0 = - "mpc" delta T_0 + delta G  = delta G (1 - "mpc")
 \
 mat(
  1-alpha, -I'_R; 
  m^d'_Y, m^d'_R
 )
 dot 
 mat(
  delta Y; delta R
 )
 = 
 mat(
  (1-"mpc") dot delta G; 0
 )
$ 

Воспользуемся методом Крамера: 


$
  delta Y  
  = mat(
    (1 - "mpc") delta G, -I'_R; 0, m^d'_R
    )/Delta 
    = 
    (overbrace((1-"mpc"),(+)) dot overbrace(m^d'_R, (-)))/Delta  dot underbrace(delta G, (+)) > 0
$
$
  delta R 
  = mat(
    1 - alpha, 1 - "mpc" delta G; m^d'_R, 0
    )/Delta 
    = 
    (-overbrace((1-"mpc"),(+)) dot overbrace(m^d'_y, (+)))/underbrace(Delta, (-))  dot underbrace(delta G, (+)) > 0

$

#image("/assets/image-4.png")


Вторая политика: 

$
  delta G = delta B "при " delta M = 0 ==> delta A_0 = delta G 
$

$
  delta G  = delta B  \
  mat(
    1 - alpha , -I'_R; 
    m^d'_Y, m^d'_R 
  )
  dot 
  mat(
    delta Y; delta R 
  )
  = 
  mat(
    delta G; 0
  )
$

$
  delta Y 
  =
  mat(delta G, -I'_R; 0, m^d'_R)/Delta  = overbrace(m^d'_R, (-))/underbrace(Delta,(-)) dot underbrace(delta  G , (+))> 0
$

$
  delta R 
  = 
  mat( (1-alpha), delta G; m^d'_Y, 0)/Delta 
  = 
  overbrace(-m^d'_Y, (+))/Delta dot underbrace(delta G, (+)) > 0  
$

Рассмотрим следующий вариант. 

$
  delta T_0 < 0 "при" delta M = 0, quad delta A_0 = -"mpc" T_0 >0
$

$
  mat(
    (1 - alpha), -I'_R; 
    m^d'_Y , m^d'_R
  )
  dot 
  mat(
    delta Y; delta R 
  )
  = 
  mat(
    -"mpc" delta T_0;
    0
  )
$
$
  delta Y 
  = 
  mat(
    - "mpc" delta T_0, -I'_R; 
    0 , m^d'_R 
  )/Delta 
  = overbrace(-"mpc", (+)) dot overbrace(m^d'_R, (-))/Delta dot underbrace(delta T_0, (-)) >0 
$
$
  delta R  
  = 
  mat(
    (1 - alpha) , -"mpc" delta T_0; 
    m^d'_Y , 0
  )/Delta
  = (+"mpc" dot m^d'_R)/Delta dot delta T_0  >0 
$

#image("/assets/image-5.png")

$
  G arrow.t 
  ==> "AE"_0 arrow.t 
  ==> "AE"^1_"pl" (R_1) -> "AE"^2_"pl" (R_2) 
  \ 
  ==> "при " Y= Y_1 , quad "AE" > Y ==> "фир. увеличат производство" 
  ==> Y = Y_2, quad "AE" = Y 
$

#image("/assets/image-7.png")

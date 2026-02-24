
#show heading: set align(center)
= Макроэкономика 
=== Лекция 11 
=== Эффективность фискальной политики в модели IS-LM
=== Экономика и Анализ Данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()
#show heading: set align(left)

Чтобы оценить Эффективность фискальной политики можно использовать мультипликатор фискальной политики: 

$
  k_("fp") = (m^d'_R)/((1-alpha) dot m^d'_R + I'_R dot m^d'_Y)
$

$
  triangle Y = k_("fp") dot triangle A_0 
$

Как некоторые вещи поливают на mult 
$
  |m^d'_R| arrow.t , m^d'_Y arrow.t, |I'_R| arrow.t, alpha 
$


$
  k_("fp") = (m^d'_R)/((1-alpha) dot m^d'_R + I'_R dot m^d'_Y) = 1/((1-alpha) +  I'_R dot (m^d'_Y)/(m^d'_R))
$

Как они будут реагировать на эти измененеия: 

$
  |m^d'_R| arrow.t => k_("fc") arrow.t , m^d'_Y arrow.t => k_("fc") arrow.b, |I'_R| arrow.t => k_("fc") arrow.b, alpha => k_("fc") arrow.t 
$


I
 

How did we interpret the fiscal policy in the IS-LM model? (consider that $delta G =  delta B$)

II

Теперь рассмотрим то что мо показали математически сравнив экономики А и B, такие что $|m^d'_R|_A > |m^d'_R|_B, alpha = "const"$, 

III 

+ Первый график не меняется. 
+ Второй меняется. 

$
  m^d = m^d'_Y dot Y + m^d'_R dot R\
  delta (m^d) = m^d'_Y dot delta Y + m^d'_R dot delta R ==> (delta R)/(delta(M/P))|_(m^d) = 1/(m^d'_R)
$

Проводим стимулирующ фискальную политику. 

Измененеия на денежном рынке будут проходить через одну точку, хотя и будут иметь разные наклоны в зависимости от экономики. 

$
  
  triangle Y_("kk") = 1/(1-alpha) dot triangle G , quad triangle Y_("IS-LM") = k_("fp")
$

$
  G arrow.t => Y_1 -> Y_2 => triangle Y_("kk") = 1/(1-alpha) dot triangle G => triangle Y_("kk")_A + triangle Y_("kk")_B ==> Y arrow.t => m^d (Y arrow.t) => \
  m^d (Y_1) -> m^d(Y_2) => m^d > (M^S)/P "and " D_"цб" < S_"цб" => R arrow.t => triangle R_A < triangle R_B => triangle I = I'_R dot triangle R => \
  |triangle I|_A < |triangle I|_B  => A < B => triangle Y_("IS-LM") = triangle Y_("kk") - "Экономика A B" => triangle Y_("IS_LM"_A) > triangle Y("IS_LM"_B)
$

Рассмотрим теперь такие экономики что такие что $|m^d'_Y|_A > |m^d'_R|_Y,a alpha ="const"$. 

IV 

Оценим измененеия ставки процента. 


$
  M/P = m^d'_Y dot Y + m^d'_R dot R\
  delta (M/P )= m^d'_Y dot delta Y + m^d'_R dot delta R \
  delta R = -(m^d'_Y)/(m^d'_R) dot delta Y 
$
Рассмотрим теперь такие экономики что такие что $|I'_R|_A > |I'_R|_B, alpha ="const"$. 

V


$
  G arrow.t => Y_1 -> Y_2 => triangle Y_("kk") = 1/(1-alpha) dot triangle G => triangle Y_("kk")_A + triangle Y_("kk")_B ==> Y arrow.t => m^d (Y arrow.t) => \
  m^d (Y_1) -> m^d(Y_2) => m^d > (M^S)/P "and " D_"цб" < S_"цб" => R arrow.t => triangle R_A bold(=) triangle R_B => triangle I = ("something here check later") I'_R dot triangle R => \
  |triangle I|_A > |triangle I|_B  => A > B => triangle Y_("IS-LM") = triangle Y_("kk") - "Экономика A B" => triangle Y_("IS_LM"_A) < triangle Y("IS_LM"_B)
$

Рассмотрим теперь что произойдет если будут измененеия $alpha$.Его измененеия можно изобразить через один график. 

VI

$
  triangle Y_("IS-LM") = triangle Y_("kk") - triangle Y_"Эк" = 1/(1-alpha) dot triangle G + 1/(1-alpha) dot triangle I = 1/(1-alpha) underbrace([triangle G + underbrace(triangle I, (-))], (1))
$

1. Обязан быть $>0$ чтобы фискальная политика имела некий эффект. 




$
  (1 - alpha) dot Y = A_0 + I'_R dot R \
  (1 - alpha) dot delta Y = delta A_0 + I'_R dot delta R \ 
$


VII


$
  1 -> 2 : delta R = - 1/(I'_R) dot delta G \ 
  1 -> 3 : delta Y = 1/(1-alpha) dot delta G 
$
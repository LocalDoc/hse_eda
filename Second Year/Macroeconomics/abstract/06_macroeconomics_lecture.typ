#show heading: set align(center)
= Макроэкономика 
== Лекция 6 "Повороты IS, Финансовый рынок в кейнсианской экономике."
== Экономика и Анализ Данных 
== Фрейре Серёгина Даниэль Фабиан


#pagebreak()
#show heading: set align(left)


О любых найденных ошибках, несостыковок, и опечаток сообщять #link("https://t.me/local_dan")[мне], либо сделать merge request на #link("github.com/LocalDoc/hse_eda/tree/main/Second Year/Macroeconomics")[гит]. Я буду очень благодарен. 

= Повороты в IS

Базовое уровнение IS: 
$
  (1 - alpha) dot Y = A_0 + I'_R dot R
$

Перепишем его зависиящего от $Y$ и от $R$. 

$
  Y(R) = 1/(1 - alpha) dot A_0 + (I'_R)/(1-alpha) dot R 
  , quad
  R(Y) = -(1)/(I'_R) dot A_0 + (1-alpha)/(I'_R) dot Y
$


#let inquiry  = $"Мы хотим рассмотреть изменениях которые дадут" alpha "и" I'_R$

#block(
  fill: luma(235),
  inset: 8pt,
  radius: 4pt,
  inquiry,
)

Уже было показано что 


$
  "Угол 1" => (delta R)/(delta Y) = (1 - alpha)/I'_R \ \ 
  "Угол 2"=> (delta Y)/(delta R) = (I'_R)/(1-alpha)
$

#set align(center)

#figure(
  image("/assets/image-2.png", width: 60%),
  caption: [Изменение отрицательной цуствительности приведет к сдвижению влево кривой IS.]
)
#set align(left)

#let inquiry  = "Возникает проблема в том что IS может сдвинуться уменьшив угол 1 или угол 2. Как понять какой из данных углов необходимо выбрать?" 

#block(
  fill: luma(235),
  inset: 8pt,
  radius: 4pt,
  inquiry,
)

Мы утверждали что :


$
Y(R) = underbrace((1 / (1 - alpha)) dot A_o, "(A)") + underbrace((I'_R / (1 - alpha)), "(angle 2)") dot R , quad 
R(Y) = underbrace((-1 / I'_R) dot A_o, "(B)") + underbrace(((1 - alpha) / I'_R), "(angle 1)") dot Y
$




#set align(center)
#figure(
  image("/assets/image-24.png", width: 60%),
  caption: [Изменение $| I'_R| arrow.t$ приводит к уменшеию угла (1) и росту угла (2).]
)
#set align(left)


Далее рассмотрим вопрос с $alpha$, она определяется $t, I'_Y, "IM"'_X, "mpc"$. Мы будем говорить только об первых трех, так как если вспомнить, то mpс тоже влияет на $"AE"_0$, а у нас их изменение не подразумевается.  

Рассмотрим эти три варианты ближе. 

Вариант один: 
$
t arrow.t => alpha = "mpc"(1 - t) dot I'_Y dot "IM"'_X => alpha arrow.b
$ 

Рассмотрев $Y(R), R(Y)$, снижение $alpha$ приведет к уменшеию угла 2. 

#set align(center)
#figure(
  image("/assets/image-14.png", width: 60%),
  caption: [Рост t приведет к падению в mpc, что приведет к падению в $alpha$. Падение $alpha$ вледет падению угла 2.]
)
#set align(left)

Вариант два: 
$
"I"'_("Y")arrow.t => alpha = "mpc"(1 - t) dot I'_Y dot "IM"'_X => alpha arrow.t
$

#set align(center)
#figure(
  image("/assets/image-16.png", width: 60%),
  caption: [ Рост чувствительности инвестиции к доходу ведет к росту $alpha$. Рост $alpha$ ведет к росту угла 2]
)
#set align(left)

Вариант три: $I'_"mY" arrow.t => alpha = "mpc"(1 - t) dot I'_Y dot "IM"'_X => alpha arrow.b  $

#set align(center)
#figure(
  image("/assets/image-17.png", width: 60%),
  caption: [ $alpha$ падает, а значит угол 2 уменьшается.]
)
#set align(left)

Вернемся к mpc который до этого момента мы игнороливали. Для удобства привяжем график модели кейнсианского креста к графику модели IS. 

#set align(center)
#figure(
  image("/assets/image-18.png", width: 60%),
  caption: [ Помним что $alpha = "mpc" (1 - t) + dots + A_0 = C_0 - "mpc" dot T_0 + I_0 + G_0, "при" "mpc" arrow.t => "AE"_0 arrow.b,alpha arrow.t.$ Падение $alpha$ приведет к увеличению угла 2 (еше и сдвиг самой кривой, т.к. есть изменение $"AE"_0$), мы перешли, в точку 2, хотя ставка процента не изменилась.]
)
#set align(left)



#pagebreak()

= Финансовый рынок в кейнсианской экономике. 

*Финансовый рынок.*

#set align(center)
#table(
  columns: 2,
  [*Денежный рынок*], [*Рынок ценных бумаг*], 
  [Денежная масса (M)],[ Облигации (B for Bonds), акции (E for Equity (???) ) ], 
  [Eq: $M^S = M^D$],[Eq: $B^S + E^S = B^D+ E^D$], 
  [$M^S$ by G, $M^D$ by households], [$B^S$ by G, $E^S$ by Firms, $B^D + E^D$ by households]
)
#set align(left)

Введем понятие равновесия на финансовом рынке. 

$
  "M"^D + "B"^D + "E"^D = "M"^S + "B"^S + "E"^S  
$

Данное выражение можно переписать как: 

$
  underbrace("M"^D - "M"^S, "(1)") = underbrace(("B"^S+"E"^S) - ("B"^D - "E"^D), (2)) 
$

+ Когда выражение $> 0$ то происходит избыток спроса, когда $< 0$ происходит избыток предложения. 
+ Когда выражение $< 0$ то происходит избыток спроса, когда $> 0$ происходит избыток предложения. 

Если есть равновесие на одном из рынков, то он есть на всех финансовых рынах. Получается что можно изучать только один рынок, традиционно, денежный. 

#let inquiry  = "Как формируется спрос и предложение на данном рынке?"

#block(
  fill: oklab(70%, -0.05, -0.1),
  inset: 8pt,
  radius: 4pt,
  inquiry,
)



*Денежная масса.*

Измеряется через денежную массу. 
$
  "M"^S = "Cash" + "Deposit" 
$

*Денежная база.* (деньги повышенной мошности)

$
  "H" = "Cash" + "RR"
$
где RR это резервы фирм. 

Денежная база, или деньги повышенной мошности являются такими потому что ЦБ может их регулировать. 

Рассмотрим баланс центрального банка в упрашенном виде:

#set align(center)
#table(
  columns: (2),
  [*Aктивы*],[*Пассивы*],
  [Official reserve (OR): Foreign currency and obligations easily sold on the foreign market. Используется чтобы произвести валютные интервенции. ],[ Cash: Деньги которые обслужывают сделки в экономике.],
  [Central Bank Bonds ($"B"_"CB"$): Гос облигации которые купил ЦБ.],[Reserves (RR): Часть принесенных денег в банк у банка нет разрешения выдавать в кредит, а надо их перечислить в *обязятельные резервы* (определяется *нормой обязятельного резервирования*.) ]
)
#set align(left)

#pagebreak()

*Банковские резервы*

Банковские резевры деляться на обязятельные ($"rr"_m("mandatory"),$ или $"rr"_"обз"$ как на лекциях. В дальнейщем я буду пользоваться $"rr"_m$), и на добровольные $"rr"_"доб"$ (Я буду пользоваться $"rr"_v("voluntary")$). Вместе будем обозночать их как $"rr"$.

После оттоков в резевры, остаются *максимальные кредитные возможности банка*. 

Все резервы банков хранятся в центральном банке.


#let inquiry  = "Рассмотрим ближе взаимосвять между денежной массой и денежной базой." 

#block(
  fill: luma(235),
  inset: 8pt,
  radius: 4pt,
  inquiry,
)

*Норма / Ставка депонирования:*

$ "cr" = "Cash" / "Deposit" $

*Денежный мультипликатор:*

Описывает взаимосвясь между денежной массой и денежной базой



$
  k_"M" = "mult"_"M"
  = ((triangle M )/ (triangle H))
  = (M / H)
  = ("Cash" + "Deposit") / ("Cash" + "RR")
  = ("cr" dot "Deposit" + "Deposit") / ("cr" dot "Deposit" + "rr" dot "Deposit")
  = (1 + "cr") / ("cr" + "rr")
$

В итоге можно выписать:


#let important  = $"mult"_"M" = (1 + "cr") / ("cr" + "rr")$ 

#set align(center)

#block(
  fill: oklab(80%, 0.05, 0.1),
  inset: 8pt,
  radius: 4pt,
  important,
)

#set align(left)
#let important  = $M = ((1 + "cr") / ("cr" + "rr"_"обз" + "rr"_"доб")) dot H$
#set align(center)
#block(
  fill: oklab(80%, 0.05, 0.1),
  inset: 8pt,
  radius: 4pt,
  important,
)
#set align(left)

#pagebreak()

#let inquiry = "Как коммерческие банки могут менять денежный поток не печатая деньги?"

#block(
  fill: oklab(70%, -0.05, -0.1), 
  inset: 8pt, 
  radius: 4pt, 
  inquiry,
)

Предпосылки: 
+ Cash = 0 
+ $n >= 2$
+ $"rr"_m != 1$

*Пример*

Допустим что норма обязятельного резервирования $"rr"_m= 0.2$ 

#set align(center)
#figure(
  image("/assets/image-25.png", width: 70%),
  caption: [Рабочиму выдали 1000 USD, он принес их в банк 1. 200 USD уходят в резервнную систему, а 800 USD банк 1 может выдать в кредит. Тот кто взя кредит покупает нечто у фирмы. Фирма принесет эти 800 USD в свой банк 2. На банк 2 так-же распростроняется норма обязательного резервирования, а значит 160 USD уходят в резервнную систему.]
)
#set align(left)


Мы можем обобщить пример чтобы рассмотреть изменение в денежной массе, где D - Deposit.

$ triangle M
= D dot (1 - "rr"), + D dot (1 - "rr")^2 + ...
= (1/(1 - (1 - "rr")))=(1 / "rr") dot D dot (1 - "rr")
$

#let important  = $triangle M  = underbrace((1 / "rr"), "mult"_"B") dot underbrace(D dot (1 - "rr"), "кред. возмож. банка 1" ) $

#set align(center)

#block(
  fill: oklab(80%, 0.05, 0.1),
  inset: 8pt,
  radius: 4pt,
  important,
)

#set align(left)

Продолжим пример:

$
triangle M = (1 / 0.2) dot 800 = 4000,
quad
M = (1 / 0.2) dot 1000 = 5000
$

---

== Моделируем денежное предложение. 

#let important  = "При моделировании денежного предложения, всегда говориться о номинальной ставки процента."
#block(
  fill: oklab(80%, 0.05, 0.1),
  inset: 8pt,
  radius: 4pt,
  important,
)


#set align(center)
#figure(
  image("/assets/image-26.png", width: 60%),
  caption: [(a) Фиксируем покупательную способность, (b) Хотим зафиксировать оба, (c) Фиксируем номинальную ставку процента ]
)
#set align(left)

*Спрос на деньги* ($"m"^d$)

Спрос на деньги это спрос на покупательную способность денег.  
Изменение цен не влияет на спрос на деньги. Как пример, при желании купить 5 кричпичей за 1000 USD, спрос на деньги это 5. 

Классики:  
$"m"^d(Y)$ положительно определены от уровня дохода $Y$.

Кейнс:  
$"m"^d(Y,R)$ — положительно определены от уровня дохода и отрицательно от номинальной ставки процента. 

#set align(center)
#figure(
  image("/assets/image-20.png", width: 60%),
  caption: [Чем выше уровень дохода тем выше спрос на деньги.]
)
#set align(left)

Формула по cпроса на денег по Кейнсу:

#let important  = $"m"^d(Y,R)_"KK" = "m"^d(Y,R)  = underbrace("m"^d'_Y, "(+)") dot Y + underbrace("m"^d'_R, "(-)") $

#set align(center)
#block(
  fill: oklab(80%, 0.05, 0.1),
  inset: 8pt,
  radius: 4pt,
  important,
)
#set align(left)

*Равновесие денежного рынка:*

Формально это: 

$
"M"^S / p = m^d =  underbrace("m"^d'_Y, (+)) dot Y + underbrace("m"^d'_R, (-)) dot R
$



#set align(center)
#figure(
  image("/assets/image-21.png", width: 60%),
  caption: [Справа мы наблюдаем график рынка ценных бумаг в координатах ставки процента по гос облигациям (R) и количества ценных бумаг. Можно наблюдать отрицательнцю зависимость ставки процента и количества ценных бумаг, так как чем выше ставка по гос облигациям тем меньше гос облигаций будут выпускаться правительством.]
)
#set align(left)

Допустим, экономика вышла из равновесия ($R_2 > R_1$).


#set align(center)
#figure(
  image("/assets/image-23.png", width: 60%),
  caption: [На денежном рынке произошел избыток предложения на деньги, и на рынке ценных бумаг дефицит предложения. Ставка процента на рынке ценных бумаг начнет падать, и *только потом * денежный рынок тоже начнет спускать ставку.]
)
#set align(left)

Формализуем то что у нас произшло: 

$
arrow.t R
=> "при" R =  R_2
-> "m"^d < "M"^S / p
-> D_"цб" > S_"цб"
=> arrow.b R "пока" R=R_1 , "где"  D_"цб" = S_"цб"
$

$
"но так как"-> "m"^d(R) "отрицательно зависит от ставки процента"  => arrow.t "величина спроса на денги"
$

#let important  = $=> R = R_1, "m"^d = "M"^S / p,D_"цб" = S_"цб"$

#set align(center)
#block(
  fill: oklab(80%, 0.05, 0.1),
  inset: 8pt,
  radius: 4pt,
  important,
)
#set align(left)

$
triangle.filled 
$
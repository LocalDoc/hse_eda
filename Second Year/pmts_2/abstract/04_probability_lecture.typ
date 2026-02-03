#show heading: set align(center)
= Теория Вероятности и Математическая Статистика 
== Лекция 4
== Экономика и Анализ Данных 
== Фрейре Серёгина Даниэль Фабиан


#pagebreak()
#show heading: set align(left)


О любых найденных ошибках, несостыковок, и опечаток сообщять #link("https://t.me/local_dan")[мне], либи сделать merge request на #link("github.com/LocalDoc/hse_eda/tree/main/Second Year/Macroeconomics")[гит]. Я буду очень благодарен. 

=== (2)

Рассмотрим своство многомерного нормального распределения. 

Пусть $xi ~ N( mu, C )$ где $xi = (xi_1, dots, xi_n)$, $mu = (mu_1, dots, mu_n)$, C - ковариционаня матрица. 

Тогда, если $A_{n times k}$ - матрица полного ранга ($"rank"A = k$), то: 

$
  eta = A xi + b, b in RR^k => eta ~ N(A mu + b, "ACA"^"T")
$

$square$
$
  "По определению: " xi = A' z + b', "где" z ~ N (0,I) \ \
  "Тогда: " eta = A dot A' z + A b' + b = A'' z + b'' ~ N(dots,dots) \ \
  "Где, A'' = A dot A'", quad "b'' = A b' + b" \ \
$

#set align(right)
$qed$

#set align(left)

=== (3)

Пусть $xi ~ N(mu , mat(sigma_1^2, 0; 0, sigma^2_1))$ где $xi = (xi_1, dots, xi_n), mu = (mu_1, dots, mu_n)$.

Тогда $(xi_1, ..., xi_n)$ независимы. 


$square$

$
  f_(xi) (x_1,dots, x_n) = 1/(sqrt(2 pi))^n dot 1/(sigma_1 dot dots dot sigma_n) e^(-1/2 dot {((x_1 - mu_1)^2)/sigma_1^2 + dots + ((x_n - mu_n)^2)/sigma_n^2 }) = 
  \ \
  1/sqrt(2 pi) dot 1/sqrt(sigma_1) e^(-1/2 (x_1-mu_1/sigma_1)^2) dot 1/(sqrt(2 pi)) dot 1/(sigma_2) e^(-1/2 (x_2-mu_2/sigma_2)^2) dots 1/(sigma_n) e^(-1/2 (x_n-mu_2/sigma_n)^2)  =
  \ \
  f_(xi_1)(x_1) dot dots dot f_(xi_n)(x_n)
  \ \
  "Отметим что: " (x- mu)^T C^(-1) (x - mu) = (x - mu) dot mat(1, 0, dots, 0; sigma_1^2, 1, dots, 0; 0, 1/(sigma^2_n), dots, 0; dots, dots, dots, 1/(sigma_n^2))
$

#set align(right)

$qed$

#set align(left)

#pagebreak()

=== Условное нормальное распределние: 

=== (4)

Пусть $n  = 2$, т.е. $vec(z_1, z_2) ~ N (vec(0,0), mat(1, rho; rho, 1))$, где $rho = "corr"(z_1, z_2)$. 


Иногда говорять что создается статистическая линейная свзять. Представим $z_2 = rho z_1 + underbrace(u,"шум")$, где $u "и" z_1$ независимы, и $u ~ N(dots, dots)$.


$square$

$
  "Введем случайную величину" u = z_2 - rho z_1 underbrace(~, "блаблабла" ) N 
  \ \ 
  "Отметитм что: " z_2 - rho z_1 = vec(u, z_1) = mat(-rho, 1; 1,0) dot vec(z_1, z_2) ~ N (vec(0,0), (?))
  \ \ 
$
Для нахождения (?). 
$  
  "Var"(u)= underbrace("Var"(z_2), 1) - 2 rho  underbrace("cov"(z_2 , z_1) ,rho) + rho^2 underbrace("Var"(z_1),1) = 1 - 2 rho^2 + rho^2 = 1 - rho^2
  \ \ 
  "cov"(u, z_1) = "E"(u dot z_1) - underbrace("E"(u), 0) dot underbrace("E"(z_1),0) = "E" (z_2 - rho z_1) z_1  = underbrace("E" (z_2 dot z_2), rho) - rho underbrace("E" z_1^2,  1) = rho - rho = 0
$

#set align(right)
$qed$

#set align(left)

Получается что: 
$
    z_2 - rho z_1 = vec(u, z_1) = mat(-rho, 1; 1,0) dot vec(z_1, z_2) ~ N (vec(0,0), mat(1 - rho^2, 0; 0, 1))
$

=== (5.1)

Пусть $n  = 2$, т.е. $vec(z_1, z_2) ~ N (vec(0,0), mat(1, rho; rho, 1))$, где $rho = "corr"(z_1, z_2)$. 

Если мы зафиксируем $z_2 | z_1 = x$, то $x_2$ останеться с. в. , при этом можно утверждать что второе останеться $~ N(rho x, 1 - rho^2)$. 

Воспользуемся (4) чтобы доказать данное свойство. 

$square$

$
  "Пусть" z_2 = rho z_1 + u, "зафиксируем " z_2 | z_1 = x => underbrace(rho x + u ~ N (rho x, 1 - rho^2), "мы знаем что " u ~ N(0, 1 - rho^2) \ \ "Var"(rho + ?) = "Var"(u)) ,  
$

#set align(right)
$qed$
#set align(left)


Получается что $"E" (z_2 | z_1 = x) =  rho x$ - регрессия линейная.


=== Бонусная задача: 
Доказать (5) в лоб. Нужно вывести функцию распределения и показатьч то $f_(z_2 | z_1 = x) (y) = 1/(sqrt(2 pi)) dot 1/(sqrt(1 - rho^2))dot e^(-1/2((y-rho x)/sqrt(1 - rho^2))^2)$ где: $f_(z_2|z_1 = x) = (f(z_1, z_2))/(f_z_1(x))$

=== (5.2)

Рассмотрим нестандартные нормальное распределение. 

Пусть $vec(xi_1, xi_2)~ "N" (vec(mu_1, mu_2), mat(sigma_1^2, rho sigma_1 sigma_2; rho sigma_1 sigma_2, sigma_2^2)$. 

$
  xi_2 | x_1 = x ~ N (mu_2 + rho sigma_2 (x - mu_1)/sigma_1, sigma_2^2 (1 - rho^2) )
$

$square$

$
  xi_2^*=(xi_2- mu_2)/sigma_2 => xi_2 = sigma_2 dot xi_2^* + mu_2 , quad xi_1 = dot sigma_1 dot xi^*_1 + u_1 
  \ \ 
  "E"(xi_2 | xi_1 = x) = "E" (sigma_2 xi_2^* + mu_2| xi_1^* = (x - mu_1)/sigma_1)
  \ "воспользуемся линейностю математического ожидания" \ 
  sigma_2  underbrace("E" (xi_2^* | xi_1^* = (x - mu_1)/sigma_1 ), rho dot (x - mu_1)/sigma_1 ) + mu_2 = mu_2 + rho sigma_2  (x - mu_1)/sigma_1
  \ "Теперь для дисперсии Var"(xi_2 | xi_1 = x) \
  "Var"(xi_2 | xi_1 = x)  =  "Var" (sigma_2 xi_2^* + mu_2 | xi_1^* = (x - mu_1)/sigma_1) = sigma^2 (1 - rho^2 ) 

$

#set align(right)
$qed$
#set align(left)

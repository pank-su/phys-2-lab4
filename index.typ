#import "lib/template.typ": *

#show: gost

= Цель работы
Определить радиус кривизны линзы из наблюдения интерференционных колец
Ньютона.

= Описание лабораторной установки

#grid(
  columns: (5fr, 1fr),
  gutter: 0.3cm,
  [
    #h(1.25cm) Измерение радиусов колец Ньютона осуществляется с помощью микроскопа $M$ (@lab),
    под которым размещена стеклянная пластинка $П$ с лежащей на ней выпуклой линзой $Л$.
    Освещение производится источником света $S$ через линзу $Л_1$, светофильтр $Ф$ и
    отражающую пластинку $С$, установленную под углом $45 degree$. Свет, отражённый
    от линзы $Л$ и пластинки $П$, образует интерференционную картину (кольца
    Ньютона), наблюдаемую в микроскоп. Радиусы колец измеряют путём горизонтального
    перемещения микроскопа с помощью микрометрического винта.
  ],
  [
    #figure(
      image("images/000_изображение_лаб_установки.png", width: 80%),
      caption: "",
    ) <lab>

  ],
)

#figure(table(
  columns: 6,
  align: horizon,
  [Прибор],
  [Тип],
  [Предел измерений],
  [Цена делений],
  [Класс точности],
  [$theta$],
  [Микрометрический винте],
  [---],
  [25 мм],
  [0.005 мм],
  [---],
  [0.005 мм],
), caption: "Параметры установки")

= Рабочие формулы
#set math.equation(numbering: "(1)")

Для вычисления радиус колец использовалась формула @radius:

$
  r_i = D_i/2
$ <radius>

где:
- $D$ -- диаметр i-го кольца

Радиус кривизны линзы вычисляется по формуле @R:

$
  R = ((r_k + r_m)(r_k - r_m))/(2(k-m))
$ <R>

- $lambda = 0.66 "мкм"$ -- длина волны излучения выделяемого красным светофильтром
- $k$ и $m$ берут следующими парами: (1, 7), (2, 8), (3, 9)

Среднее значение измерений находится по формуле @avg:

$
  overline(X) = (limits(sum)^N_(i=1) X_i)/N
$ <avg>

где $X$ множество значений измерений или вычислений в количестве $N$

= Результаты измерений и вычислений

#let res = csv("data/output.csv")

#{
  let _ = res.remove(0)
}

#figure(table(
  columns: 8,
  align: horizon,
  table.header(
    [N],
    [Отсчёт слева, мм],
    [Отсчёт справа, мм],
    [$D$, мм],
    [$r$, мм],
    [$r_k + r_m$, мм],
    [$r_k - r_m$, мм],
    [$R$, мм],
  ),
  ..res.flatten().map((t)=>{ eval(t, mode: "math") }),
  table.cell(colspan: 7, [#align(right, $overline(R)$)]),
  $153 plus.minus 5$,
), caption: "Результаты измерений и вычислений")

= Примеры вычислений
#set math.equation(numbering: none)

По формуле @radius:

$
  r_i = 1.405 / 2 = 0.702 "мм"
$

По формуле @R:

$
  R = ((1.150 + 0.852) * (1.150 - 0.852)) / (2 * (3 - 9)) =
  = (2.002 * 0.298) / (2 * (-6)) =
  = 0.596596 / (-12)
  ≈ 151 "мм"
$

По формуле @avg:

$
  overline(R) =
  (155 + 152 + 151) / 3
  = 458 / 3 =
  153 "мм"
$

= Вычисление погрешностей
#set math.equation(numbering: "(1)")

== Систематическая погрешность

Для систематической погрешностей использовалась формула @thetaR:

$
  theta_R = (2 dot (r_k + r_m))/(lambda dot (k - m)) dot theta_r.
$ <thetaR>

#set math.equation(numbering: none)

$
  theta_R_(1,7) = (2 dot (0.702 + 1.002))/(0.00066 dot 6) dot 0.005 = 3.408/0.00396 dot 0.005 approx 4.3 "мм" ≈ 4 "мм"
  \
  theta_R_(2,8) = (2 dot (0.778 + 1.098))/(0.00066 dot 6) dot 0.005 = 3.752/0.00396 dot 0.005 approx 4.7 "мм" ≈ 5 "мм"
  \
  theta_R_(3,9) = (2 dot (0.852 + 1.15))/(0.00066 dot 6) dot 0.005 = 4.004/0.00396 dot 0.005 approx 5.1 "мм" ≈ 5 "мм"
$

$
  theta_R_("ср") = (theta_R_1 + theta_R_2 + theta_R_3) / 3 = (4 + 5 + 5) / 3 = 14/3 ≈ 5 "мм"
$

= Вывод




Определил радиус кривизны линзы из наблюдения интерференционных колец
Ньютона:

$
R_(1,7) = 155 plus.minus 4 "мм"
\
R_(2,8) = 152 plus.minus 5 "мм"
\
R_(3,9) = 151 plus.minus 5 "мм"

\
overline(R) = 153 plus.minus 5 "мм"
$
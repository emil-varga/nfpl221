#set text(lang: "sk")

#import "@preview/touying:0.5.5": *
#import themes.university: *
#import themes.simple: * 
#import "@preview/numbly:0.1.0": numbly

#show: simple-theme.with(
  aspect-ratio: "16-9"
)

#set text(size: 0.8em)
#set math.equation(numbering: "(1)")
// #show ref: it => {
//   // provide custom reference for equations
//   if it.element != none and it.element.func() == math.equation {
//     // optional: wrap inside link, so whole label is linked
//     link(it.target)[eq.~(#it)]
//   } else {
//     it
//   }
// }


#title-slide([
  = 1. Úvod do turbulencie, dynamika tekutín

  #link("emil.varga@matfyz.cuni.cz")

  #link("https://superfluid.troja.mff.cuni.cz/nfpl221")
]
)

== Úvod

=== Zopakujte si
- Programovanie, budeme robiť numerické simulácie

=== Podmienky splnenia predmetu:
- dve zápočtové domáce úlohy
- ústna skúška v rozsahu prebraného učiva

=== Doporučená literatúra
P. A. Davidson: Turbulence\
M. Samimy _et al_, A Gallery of Fluid Motion, CUP (2003)\
M. Van Dyke, An Album of Fluid Motion 

= Obecné vlastnosti turbulentných prúdení

== Prúdenie kvapalín je turbulentné pre dostatočne vysoké rýchlosti.
#slide[
#figure(
  image("figs/increasing_re.png", height: 88%),
)
][
  #align(right)[
    #text(size: 0.8em)[M. Samimy _et al_, A Gallery of Fluid Motion, CUP (2003)]
  ]

  Reynoldsove číslo
  $ "Re" = (U D)/nu $
  kde $U$ je typická rýchlosť, $D$ je typický rozmer a $nu$ je kinematická viskozita

  Dynamická viskozita $ mu = rho nu $
]



== Turbulentné prúdenie obsahuje mnoho škál, časových aj priestorových
#slide[
#figure(
  image("figs/jet_transition.png", height: 80%),
)
][
  #align(right)[
    #text(size: 0.8em)[M. Samimy _et al_, A Gallery of Fluid Motion, CUP (2003)]
  ]

  Rôzne škály si môžeme predstavovať ako víry o rôznych veľkostiach.
]

== Turbulentné prúdenie je chaotické
#slide[
#figure(
  image("figs/grid_turbulence.png", height: 80%),
)
][
  #align(right)[
    #text(size: 0.8em)[M. Van Dyke, An Album of Fluid Motion CUP (2003)]
  ]
  Veličiny spriemerované cez súbor meraní sú ale typicky reproducibilné
  #figure(
    image("figs/grid_average.png", height: 60%),
  )
  
]

== Rozdiel medzi 2D a 3D
#slide[
V homogénnych a izotropných turbulentných prúdeniach v 3D sa energia prenáša do menších a menších škál

V 2D je to komplikovanejšie, a prenos energie môže byť smerom k väčším škálam
][
  #figure(
    image("figs/vorticity_condensate.png", height: 80%),
  )
]

= Matematický popis

== Opakovanie
#slide(composer: (1fr, 1fr))[
Gaussova veta (integrácia cez objem)
$ integral nabla dot bold(A) dif V = integral.cont bold(A) dot dif bold(S) $

Stokeskova veta (integrácie po smyčke)
$ integral (nabla times bold(A)) dot dif S = integral.cont bold(A) dot dif bold(l) $

Anti-symetrický Levi-Civitov tenzor
$ epsilon_(1 2 3) = 1 $
$epsilon_(213) = -1$, $epsilon_(113) = 0$, etc...
][
  
]

== Eulerov a Lagrangeov popis
#figure(
  image("figs/fluid_particle.png", height: 30%),
)
#columns(2, gutter: 1em)[
  *Eurlerov popis*

  Kvapalinu popíšeme v každom bode priestoru rýchlosťou $bold(u)(bold(x), t)$ a tlakom $p(bold(x))$.

  #colbreak()
  
  *Lagrangeov popis*

  Kvapalinu si predstavujeme ako zloženú z veľkého množstva "fluidických" častíc (obsahujúcich veľké množstvo molekúl, ale malých v porovnaní s geometriou prúdenia)
]
Prúdnice sú čiary v každom bode dotyčné $bold(u)$ $equiv$ trajektórie Lagrangeovských častíc

== Rovnica kontinuity
#slide(composer: (2fr, 1fr))[
Zmena hmotnosti tekutiny v objeme $V$ (integrácia beží cez hranice objemu)

$ (dif m) / (dif t) = integral_(diff V) rho bold(v) dot dif bold(S) $

Hmotnosť v objeme je $m = integral_V rho dif V$ z Gaussovej vety dostávame *rovnicu kontinuity*

$ (diff rho) / (diff t) = nabla dot (rho bold(v)) $

Pre *nestlačiteľné* kvapaliny nám zostava
$ nabla dot bold(v) = 0 $
][
  To co vtečie dnu, musí vytiecť von.
]

== Pohyb kontinua
#slide(composer: (2fr, 1fr))[
Pre element objemu kvapaliny musí platiť Newtonov zákon
$ delta m (dif bold(u))/(dif t) = bold(F) $
Sila $bold(F)$ bude mat dve zložky -- tlakovú a viskóznu.

=== Tlak

V smere osy $x$ bude pre silu pôsobiacu na krychlovy element platiť
$ F_x = delta A p(x) - delta A p(x + delta x) = -delta V (diff p)/(diff x), $
kde $delta V = delta A delta x$, t.j. $bold(F) = -delta V nabla p$
][
  #pad(left: -3em)[
    #align(horizon+left)[
        #image("figs/fluid_particle.png"),
    ]
  ]
  TODO: krychle
]

#slide(composer: (2fr, 1fr))[
  === Viskozita
  Tenzor viskózneho napätia $tau_(i j)$.

  Sila pôsobiaca na plošku $delta S$ s normálou $n_i$ (alebo vektorovo $delta bold(S)_i$)

  $ f_j = tau_(i j) delta S_i $

  Takže napr. celková sila v smere osi $x$ kvôli viskóznemu napätiu napätiu na plochách kolmých na os $z$
  $ f_x &= [tau_(z x)(z + 1/2 dif z) - tau_(z y)(z - 1/2 dif z)]dif y dif z \
        &= (diff tau_(z x))/(diff  z) dif V $
][
  #figure(
    image("figs/viscous_tensor.png"),
  )
]

Obecne bude teda N-S
$ rho (Dif u_j)/(Dif t) = - (diff p)/(diff x_j) + (diff tau_(i j))/(diff x_i) $
kde sčítame cez opakované indexy.

=== Newtonovské kvapaliny
Nazývame tie, pre ktoré platí
$ tau_(i j) = rho nu ((diff u_i)/(diff x_j) + (diff u_j)/(diff x_i)) = 2rho nu S_(i j) $
kde $S_(i j) = 1/2((diff u_i)/(diff x_j) + (diff u_j)/(diff x_i))$ je tenzor rýchlosti deformácie (_strain rate_)

#slide[
Pre Newtonovské kvapaliny sa zredukuje
$ (diff tau_(i j))/(diff x_j) = nabla^2 u_j $

Viskozita popisuje odpor voči rýchlosti šmykovej deformácie
$ tau_(x y) = rho nu (dif gamma)/(dif t) $
a
$ (dif gamma)/(dif t) = (diff u_x)/(diff y) $
][
  #figure(
    image("figs/angular_deformation.png"),
  )
]

#slide(composer: (2fr, 1fr))[
  === Konvektívna derivácia
  Rýchlosť prúdenia závisí od polohy a času, $bold(u) = bold(u)(t, x, z, y)$, zrýchlenie elementárneho objemu kvapaliny je dané zrýchlením v čase aj zmenou polohy

  Zavádzame *konvektívnu deriváciu*
  $ (Dif bold(u))/(Dif t) = (diff bold(u))/(diff t) + (diff bold(u))/(diff x) (dif x)/(dif t) + (diff bold(u))/(diff y) (dif y)/(dif t) + (diff bold(u))/(diff z) (dif z)/(dif t) $

  Alebo
  $ (Dif bold(u))/(Dif t) = (diff bold(u))/(diff t) + (bold(u) dot nabla)bold(u) $
][
  #figure(
    image("figs/convective_diff.png"),
  )
]

== Navierova-Stokesova rovnica

Spojením predchádzajúcich výsledkov dostávame *Navier-Stokesove rovnice (NS)*
$ (diff bold(u))/(diff t) + (bold(u) dot nabla)bold(u) = -1/rho nabla p + nu nabla^2 bold(u) $

Ktorú treba ešte doplniť o podmienku nestlačiteľnosti $nabla dot bold(u) = 0$ (alebo o obecnú rovnicu kontinuity) a okrajové podmienky.

*Okrajové podmienky* udávajú možné hodnoty $bold(u)$ na pevných stenách, typicky 
- pre $nu > 0$, $bold(u) = 0$ na stenách (_no-slip boundary condition_)
- pre $nu = 0$, $bold(u)dot bold(n) = 0$, kde $bold(n)$ je normála

== Čo s tlakom?
Aplikovaním $nabla dot$ na N-S a dostávame
$ nabla^2 p = - rho (diff_k u_j diff_j) u_k $<eq:p>

Čo je Laplaceova rovnica so zdrojom a je v podstate ju možné vyriešiť. Pre nekonečný objem máme Biot-Savartov vzťah

$ p(bold(x)) = rho/(4 pi) integral ([nabla dot ((bold(u) dot nabla) bold(u))](bold(x)')) / (|bold(x) - bold(x)'|)dif^3 x' $

- Vzťah medzi rýchlosťou a tlakom nie je lokálny -- zmena rýchlosti vyvolá okamžite zmenu tlaku v celom priestore, čo zas vyvolá zmenu rýchlosti 
// #pause
- dôsledok nestaľačitelnosti -- nekonečná rýchlosť zvuku 
// #pause
- ak sme mali na počiaku lokalizované $bold(u)$, tak lokalizované nezostane
// #pause
- rýchlosť nie je dobrá veličina pre popis chaotického prúdenia

== Dynamická podobnosť, Reynoldsovo číslo
Zaveďme charakteristicky rozmer $D$ a rýchlosť $U$ prúdenia (napr. priemer obtekaného telesa a rýchlosť v nekonečne). Pomocou týchto zavedieme bezrozmernú rýchlosť $tilde(bold(u)) = U bold(u)$, bezrozmernú polohu $tilde(bold(r)) = D bold(r)$ a bezrozmerný čas $tilde(t) = t D/U$.

Dosadenim sa Navier-Stokesova rovnica zredukuje na
$ (Dif tilde(bold(u)))/(Dif tilde(t)) = -tilde(nabla)tilde(p) + 1/"Re" tilde(nabla)^2bold(tilde(u)),  $
kde $ "Re" = (D U)/nu $
Je *Reynoldsovo cislo*. 

#pagebreak()
Reynoldsovo číslo je *jediný* parameter problému. Prúdenia s podobným Re a podnbou geometriou sa budú chovať podobne.

#figure(
  image("figs/similarity.png"),
)

#align(right)[
  #text(size: 0.75em)[
    Ostrovy Juana Fernandéza, Chile\
    Wikipedia
  ]
]

== Straty energie trením

Práca, ktorú konajú viskózne sily na objem $V$ (povrch $S$) za jednotku času
$ dot(W) = integral.cont_S u_j dif f_j = integral.cont_S u_j tau_(i j) dif S_i = integral (diff)/(diff x_i) (tau_(i j) u_j) dif V $
Takže hustota vykonávanej práce je $(diff tau_(i j))/(diff x_i)u_j + tau_(i j)(diff u_j)/(diff x_i)$. Prvý člen má tvar $F u$, čo je obyčajná mechanická práca.

Druhý člen je (používa sa sčítavanie cez opakovaný index a $tau_(i j) = tau_(j i)$)
$ tau_(i j) (diff u_j)/(diff x_i) = 1/2[tau_(i j) + tau_(j i)] (diff u_j)/(diff x_i) = 1/2 tau_(i j)((diff u_j)/(diff x_i) + (diff u_i)/(diff x_j)) = tau_(i j) S_(i j) = 2 rho nu S_(i j) S_(i j) $
*Strata energie na jednotku hmotnosti* $epsilon = 2 nu S_(i j) S_(i j)$

Priamy výpočet (dosadením N-S)
$ (diff)/(diff t)(u^2/2) = - nabla dot [(u^2/2 + p/rho)bold(u) + nu (nabla times bold(u)) times bold(u)] - nu (nabla times bold(u)) $

Pre doménu $V$ uzavrenú stenami (na ktorých je $bold(u)dot dif bold(S) = 0$) je
$ (dif)/(dif t) integral (u^2/2) dif V = integral epsilon dif V = - nu integral (nabla times bold(u))^2 dif V $

=== Vorticita
$ bold(omega) = nabla times bold(u) $

=== Enstrofia
$ S = |bold(omega)|^2 $

== Bernoulliho rovnica

$ (diff)/(diff t)(u^2/2) = - nabla dot [(u^2/2 + p/rho)bold(u) + nu (nabla times bold(u)) times bold(u)] - nu (nabla times bold(u)) $

Pre bezvírivé ($nabla times bold(u) = 0$) a ustálené prúdenie $diff_t bold(u) = 0$ je 
$ nabla(1/2 u^2 + p/rho)dot bold(u) = 0, $
t.j., po prúdnici *Bernoulliho rovnica*
#columns(2)[
  $ 1/2 u^2 + p/rho = "const" $
  #colbreak()
  #figure(
    image("figs/bernoulli.svg"),
  )
]

== Vorticita, rovnica dynamiky vorticity
Vorticita udáva mieru otáčania
#columns(2)[
 #figure(
   image("figs/body_rotation.svg"),
 )
 $ u_x &= r sin(phi)\
 u_y &= r cos(phi) $
   
 #colbreak()
   
 $u_theta = Omega r$, $ bold(u) = Omega(-y, x, 0) $
 
 a $ bold(omega) = 2Omega bold(e)_z $
]

#pagebreak()
Avšak
#figure(
  image("figs/vorticity_examples.png", height: 15em),
)

== Dynamika vírivosti

Pohybová rovnica pre vorticitu ($nabla times "NS"$) neobsahuje tlak
$ (Dif bold(omega)) / (Dif t) = (bold(omega) dot nabla)bold(u) + nu nabla^2 bold(omega), $
kde sme použili 
$ nabla (u^2/2) = (bold(u) dot nabla) bold(u) + bold(u) times bold(omega)$

=== Natahování vírov (Vortex Stretching)
#grid(columns: (1.25fr, 1fr), gutter: 2pt)[
$ (bold(omega) dot nabla) bold(u) $
- vorticita a gradient rýchlosti musia byť kolineárne
- "naťahuje" víry po ich dĺžke, čím *zvyšuje vorticitu*
- v 2D je identicky nula
][
  #figure(
    image("figs/vortex_stretching.png"),
  )
]

== Výrivosť v 2D
Keďže vortex stretching je identicky 0: advekcia-difúzia
$ (diff bold(omega))/(diff t) = - (bold(u)dot nabla)bold(omega) + nu nabla^2bold(omega) $

Vznik a difúzia vorticity u steny
#columns(2, gutter: 3pt)[
  $ (diff omega)/(diff t) = nu (diff^2 omega)/(diff y^2) $

  Riešenie je tvare
  $ omega = (2/pi)^(1/2)(V/delta)e^(-y^2slash (4nu t)) $
  s $delta = (2nu t)^(1/2)$
  #colbreak()
  #figure(
    image("figs/vorticity_diffusion.png"),
  )
]

== Kelvinova veta
#slide[
Pre $nu = 0$ a plochu $S_m$ (ohraničená $C_m$) ktorá sa pohybuje s prúdením je
$ (dif)/(dif t) integral_(S_m) bold(omega)dot dif bold(S) = 0 $
Alebo: cirkulácia $Gamma = integral.cont_(C_m) bold(u)dot dif bold(l) = "konst."$

Tok vorticity $Phi = integral bold(omega) dif bold(S)$ cez vírovú trubicu je konštantný kvôli $nabla dot bold(omega) = 0$ a $Phi = Gamma$

*Dôsledok* vírové trubice sú unášané prúdením 
][
  #figure(
    image("figs/vortex_tube.png"),
  )
]

== Experimentálne metódy
Existuje množstvo experimentálnych metód, ktoré môžeme deliť do dvoch širokých skupín

=== Lokálne merania
*Hot wire anemometry*
Meranie lokálnej rýchlosti prúdenia pomocou tepelného prenosu z žhaveného vlákna.

TODO:obrázok

*Laser Doppler anemometry*
Menej invazívne, výžaduje častice a optický prístup.

TODO: obrázok

=== Zobrazovacie metódy
*Particle tracking veolcimetry / particle image velocimetry (PIV/PTV)*
Do prúdenia je vypustené menšie/väčšie množstvo častíc, ktorých pohyb je individuálne/kolektívne sledovaný

*Molecular tagging velocimetry*
Časť molekúl v prúdení je "označená" excitovaním elektronického stavu, ich poloha je po čase sledovaná indukovanou flourescenciou.

*Schlieren*
V minulosti využívané v aeronautike
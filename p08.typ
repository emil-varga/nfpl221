#set text(lang: "sk")

#import "@preview/touying:0.5.5": *
#import "@preview/cetz:0.3.2"
#import themes.university: *
#import themes.simple: * 
#import "@preview/numbly:0.1.0": numbly



#show: simple-theme.with(
  aspect-ratio: "16-9"
)

#set text(size: 0.75em)

#title-slide([
  = 8. Onsagerov plyn vírových bodov

  #link("emil.varga@matfyz.cuni.cz")

  #link("https://superfluid.cz/nfpl221")
]
)

== Motivácia - baroklinická turbulencia
#figure(image("figs/baroclinic_vortex_gas.png"))
#align(right)[
  B. Gallet, R. Ferrari The Vortex gas scaling regime of baroclinic turbulence, PNAS *117*, 4491 (2020)
]
//== Obecné 2D prúdenie
//TODO

== Vírové body
Turbulentné prúdenie si predstavíme ako zložené z elementárnych vírov s cirkuláciami $plus.minus Gamma$.

#grid(columns: (3.5fr, 1fr),
  [
    Rýchlostné pole víru v bode $bold(s)$
    $ bold(v) (bold(r)) = Gamma/(2pi) (bold(hat(z)) times (bold(r) - bold(s)))/abs(bold(r) - bold(s))^2 $

    Pre jeden bod, cirkulácia po uzavretej krivke $cal(C)$ je
    $ Gamma_cal(C) = integral.cont_cal(C) bold(v)dot dif bold(l) &= Gamma "ak" bold(s) in cal(C) \
    &= 0 "inak" $

    Obecne, cirkulácia po danej krivke $cal(C)$ je daná súčtom obsiahnutých vírov
    $ integral.cont_cal(C) bold(v) dot dif bold(l) = sum_j Gamma_j $
  ],
  [
    
    #cetz.canvas({
      import cetz.draw: *
      circle((0,0), radius: 0.25, stroke: none, fill: red)
      circle((0,0), radius: 2, stroke: (dash: "dashed"))
      content((0,-3), [$cal(C)$])
    })
  ]
)
== Paralelné a anti-paralelné vírové body
#slide[
  *Paralelný vírový pár*
  Dva vírové body sa budú otáčať okolo svojho stredu
  //TODO obrázok

  *Spojitosť s klasickými spojitými vírmi*
  Vírová hustota $n_V$
  //TODO obrázok
][
  *Anti-Paralelný vírový pár*
  Rýchlosť propagace
  $ v_2 =  $ //TODO

  *2D obdoba 3D vírového kroužku*
  Rýchlosť propagace
  $ v_R = $ //TODO
]

== Hamiltonián a kanonické pohybové rovnice
#slide(composer: (2fr, 1fr))[
  Pre viacero vírov sú všetky víry unášané rýchlostným poľom generovaným všetkými ostatnými
  $ dot(bold(r)_j) = kappa/(2pi)sum_(k eq.not j) Gamma_k (hat(bold(z)) times (bold(r)_j - bold(r)_k))/
  (abs(bold(r)_j - bold(r)_k)^2) $

  Alebo po zložkách, $hat(bold(z)) times (x, y) = (-y, x)$ dostávame pohybové rovnice
  $ dot(x)_j &= - kappa/(2pi) sum_(k eq.not j) Gamma_k (y_j - y_k)/ (abs(bold(r)_j - bold(r)_k)^2) \
  dot(y)_j &= kappa/(2pi) sum_(k eq.not j) Gamma_k (x_j - x_k)/ (abs(bold(r)_j - bold(r)_k)^2) $
][
  //TODO: obr
]

Všimnite si, že, napr. 
$ (x_j - x_k)/ (abs(bold(r)_j - bold(r)_k)^2) = (diff)/(diff x_j)log(abs(bold(r)_j - bold(r)_k)) $

A pohybové sa dajú napísať v tvare
$ Gamma_j dot(x)_j = (diff H)/(diff y_j) "       " Gamma_j dot(y)_j = -(diff H)/(diff x_j) $
Kde Hamiltonián systému je 
$ H = -1/(2pi)sum_(j eq.not k) Gamma_j Gamma_k log abs(bold(r)_j - bold(r)_k) $
Takže $x$ a $y$ sú kanonicky združené premenné, čiže fázový priestor je totožný s polohami

== Stavy s veľkou a malou energiou
$ H = kappa/(2pi)sum_(j eq.not k) Gamma_j Gamma_k log abs(bold(r)_j - bold(r)_k) $
Hamiltonián nie je ohraničený zdola ani zhora a diverguje pre veľmi malé aj veľmi veľké vzdialenosti.

#columns(2)[
  *$Gamma_j = Gamma_k$*
  
  Pre $bold(r)_j -> bold(r)_k$ je $H -> infinity$

  Pri disipácií (ak sa bude energia strácať napr. trením) sa budú paralelné víry odpudzovať.
  //TODO: obrazok
  #colbreak()
  *$Gamma_j = -Gamma_k$*

  Pre $bold(r)_j -> bold(r)_k$ je $H -> -infinity$

  Pri disipácií sa budú anti-paralelné víry priťahovať.

  //TODO: obrazok
]

#pagebreak()
=== Pre veľé počty častíc
#columns(2)[
  *Veľká energia*: Hurikán

  #colbreak()
  *Malá energia*: Vírové dipóly

]

== Termodynamika vírového plynu
Vírové body sa pohybujú ako nemenné objekty, vo veľkých množstvách chaotickým spôsobom, a ak neuvažujeme trenie, tento pohyb spĺňa kanonické pohybové rovnice. Môžeme uvažovať o "plyne" vírových "častíc".

#let m(it) = [$angle.l it angle.r$]

=== Opakovanie termodynamiky
Prvá veta termodynamiky sa dá zapísať ako $ dif U = T dif S - p dif V, $ kde vnútorná energia $U = #m[H]$ Pri Onsagerovom vírovom plyne typicky uvažujeme _mikrokanonický_ štatistický súbor pri ktorom je celková energia konštantná a entropia je daná
$ S = k_B log n, $
kde $n$ je počet mikrostavov s danou energiou.

=== Entropia vírového plynu
Počet mikrostavov $n$ je možné určiť napr. pomocou Monte-Carlo metód

=== Teplota vírového plynu
Teplotu plynu zavedieme rovnako, ako v termodynamike
 $ T = ((diff U)/(diff S))_V $

== Plyn v konečnom objeme
Plyn existuje v konečnom a fixnom objeme (resp. ploche) $A$ $arrow.double$ celkový objem fázového priestoru $ Omega = integral dif x_1 dif y_1 dif x_2 dif y_2 ... dif x_n dif y_n = A^n $

Zaveďme funkciu $Phi(E)$ ktorá udáva veľkosť fázového priestoru pre ktorý je $H(x_1, y_1, x_2, y_2...) < E$, t.j.
$ Phi(E) = integral_(H < E) dif Omega = integral_(-infinity)^E Phi'(E) dif E, $
kde druhá rovnosť je len z definície integrálu. Z definície musí byť $Phi'(E) > 0$

Musí platiť 
$ Phi(-infinity) = 0 "                    " Phi(+infinity) = A^n $

Takže musí tiež byť $Phi'(plus.minus infinity) = 0.$ $Phi'(E)$ teda musí mať maximum pre nejaké $E_m$, $Phi''(E_m) = 0$
//TODO: obrazok

Entropia vyjadrená pomocou $Phi$ je
$ S = k_B log((Phi'(E))/Omega_1), $
kde $Omega_1$ je fázový objem na jeden stav.

A pre teplotu bude platiť
$ T = ((dif S)/(dif E))^(-1) prop Phi'/Phi'' $

*Takže*
#align(center)[
#rect[
- Pre $E < E_m$, $T > 0$
- Pre $E > E_m$, $T < 0$
- Pre $E = E_m$, $T = plus.minus infinity$
]
]

== Záporné teploty
#slide()[
  *Laser*

  Asi najznámejší príklad záporných absolútnych teplôt je laser.
  - kanonický súbor
  - populačná inverziy
][
  *Vírové body*
  - mikrokanonický súbor
  - vysoké energie vyžadujú Usporiadanie
]
== Usporiadanie na veľkých škálach a záporné teploty
Stavy s nízkou aj vysokou energiou majú malú entropiu a vyžadujú Usporiadanie
== Evaporačné ohrievanie

== Kondenzácia

== Disipácia / vzájomné trenie

== Experimentálne Realizácie
=== Bose-Einsteinov kondenzát
#figure(image("figs/giant_vortex_clusters.png", height: 70%))
Gauthier et al., Science *364*, 1264–1267 (2019)

=== Polaritóny
#figure(image("figs/polaritons.png", height: 75%))
R. Panico _et al._, Nat. Photonics *17*, 451 (2023)

=== Supratekuté hélium
#figure(image("figs/bowen_clusters.png", height: 65%))
Y. Sachkou _et al._, Science *366*, 1480 (2019)
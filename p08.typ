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

== Obecné 2D prúdenie

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
Takže $dot(x) = {x, H}$ a $dot(y) = {y, H}$ a $x$ a $y$ sú kanonicky združené premenné

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
Prvá veta termodynamiky sa dá zapísať ako $ dif U = T dif S - p dif V, $ kde vnútorná energia $U = #m[H]$

=== Entropia vírového plynu

=== Teplota vírového plynu

== Evaporačné ohrievanie

== Usporiadanie na veľkých škálach a záporné teploty

== Disipácia / vzájomné trenie

== Experimentálne Realizácie
Supratekutiny, využíva sa kvantovanosť vírov
=== Bose-Einsteinov kondenzát

=== Supratekuté hélium
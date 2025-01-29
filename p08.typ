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
][
  *Anti-Paralelný vírový pár*
]

== Hamiltonián a kanonické pohybové rovnice

== Stavy s veľkou a malou energiou

== Termodynamika vírového plynu
=== Opakovanie termodynamiky

=== Entropia vírového plynu

=== Teplota vírového plynu

== Evaporačné ohrievanie

== Usporiadanie na veľkých škálach a záporné teploty

== Disipácia / vzájomné trenie

== Experimentálne Realizácie
Supratekutiny, využíva sa kvantovanosť vírov
=== Bose-Einsteinov kondenzát

=== Supratekuté hélium
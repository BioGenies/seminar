---
title: "Shiny: wstęp"
author: "Michał Burdukiewicz"
output: ioslides_presentation
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
```

## Po co jest Shiny?

Aby łatwo zamieniać kod w R w aplikacje.

## W jaki sposób Shiny komunikuje się z R?

Przez dwie listy: input i output.

## Programowanie reaktywne

<img src="https://shiny.rstudio.com/images/reactivity_diagrams/roles.png" width="700px">

Żródło: https://shiny.rstudio.com/

## Programowanie reaktywne

<img src="https://shiny.rstudio.com/images/reactivity_diagrams/roles_implement.png" width="700px">

Żródło: https://shiny.rstudio.com/

## Izolacja

isolate() - blokuje relacje między elementami.

## Obserwacja wydarzeń

observeEvent() - działania w wyniku jakiegoś wydarzenia.

## Obserwacja wydarzeń

reactiveEvent() - aktualizacja wartości tylko w przypadku reakcji na wydarzenie.

## Optymalne aplikacje Shiny

[Plot caching](https://shiny.rstudio.com/articles/plot-caching.html).

Dobre rady: 

**There are multiple ways you can improve the performance of your plots. For example, you could consider using R’s base graphics instead of a plotting package, using JavaScript graphics that render on the client instead of static plots that render on the server, or you could change the type of plot, e.g. switching from ggplot2::geom_point to ggplot2::geom_hex.**

## Plan spotkań

Moduły w Shiny: zarządzanie namespace w Shiny.

Golem: pakietowanie apek.

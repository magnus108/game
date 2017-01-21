module Nim.Models exposing (Nim, init, heaps, replaceHeaps)
--fix moduel

import Nim.Heaps.Models exposing (Heaps)

import Nim.Players.Models exposing (Players)


type Nim
  = Nim Heaps Players


init : Heaps -> Players -> Nim
init xss ps =
  Nim xss ps


heaps : Nim -> Heaps
heaps (Nim xss _) =
  xss


replaceHeaps : Heaps -> Nim -> Nim
replaceHeaps yss (Nim xss ps) =
  Nim yss ps

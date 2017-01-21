module Nim.Players.Models exposing (Players, init)
--move to module

type Players
  = Players Int


init : Int -> Players
init x =
  Players x

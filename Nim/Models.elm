module Nim.Models exposing (Nim)


import Nim.Heaps.Models exposing (Heaps)

import Nim.Players.Models exposing (Players)


type Nim
  = Nim Heaps Players

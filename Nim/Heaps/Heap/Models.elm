module Nim.Heaps.Heap.Models exposing (Heap)


import ListZipper exposing (ListZipper)

import Nim.Heaps.Heap.Match exposing (Match)


type alias Heap =
  ListZipper Match

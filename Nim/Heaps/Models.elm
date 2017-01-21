module Nim.Heaps.Models exposing (Heaps)


import ListZipper exposing (ListZipper)

import Nim.Heaps.Heap.Models exposing (Heap)


type alias Heaps =
  ListZipper Heap

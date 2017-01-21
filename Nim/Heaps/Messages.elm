module Nim.Heaps.Messages exposing (Msg(..))


import Nim.Heaps.Heap.Messages


type Msg
  = Left
  | Right
  | HeapMsg Nim.Heaps.Heap.Messages.Msg

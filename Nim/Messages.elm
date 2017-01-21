module Nim.Messages exposing (Msg(..))


import Nim.Heaps.Messages


type Msg
  = HeapsMsg Nim.Heaps.Messages.Msg

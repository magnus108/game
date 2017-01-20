module Messages exposing (Msg(..))


import Nim.Messages


type Msg
  = NoOp
  | NimMsg Nim.Messages.Msg

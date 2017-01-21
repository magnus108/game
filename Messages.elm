module Messages exposing (Msg(..))


import Nim.Messages


type Msg
  = NimMsg Nim.Messages.Msg

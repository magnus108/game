module Nim.Update exposing (update)


import Nim.Models exposing (Nim)
import Nim.Messages exposing (Msg(..))


update : Msg -> Maybe Nim -> (Maybe Nim, Cmd Msg)
update msg nim =
  case msg of
    NoOp ->
      ( nim, Cmd.none )

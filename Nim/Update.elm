module Nim.Update exposing (update)


import Nim.Models exposing (Nim)
import Nim.Messages exposing (Msg(..))

import Nim.Heaps.Update


update : Msg -> Maybe Nim -> (Maybe Nim, Cmd Msg)
update msg maybeNim =
  case msg of
    HeapsMsg subMsg ->
      let
        ( maybeUpdatedHeaps, cmd ) =
          Nim.Heaps.Update.update subMsg (Maybe.map Nim.Models.heaps maybeNim)
      in
        ( Maybe.map2 Nim.Models.replaceHeaps maybeUpdatedHeaps maybeNim
        , Cmd.map HeapsMsg cmd
        )

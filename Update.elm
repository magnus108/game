module Update exposing (update)


import Maybe.Extra

import Models exposing (Game)
import Messages exposing (Msg(..))

import Nim.Update


update : Msg -> Game -> (Game, Cmd Msg)
update msg game =
  case msg of
    NimMsg subMsg ->
      let
        ( maybeNim, cmd ) =
          Nim.Update.update subMsg (Models.toNim game)
      in
        ( Maybe.Extra.mapDefault Models.wonGame Models.nimGame maybeNim
        , Cmd.map NimMsg cmd
        )


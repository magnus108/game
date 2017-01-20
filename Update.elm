module Update exposing (update)


import Models exposing (Game)
import Messages exposing (Msg(..))


update : Msg -> Game -> (Game, Cmd Msg)
update msg game =
  case msg of
    NoOp ->
      ( game, Cmd.none )

module Subscriptions exposing (subscriptions)


import Models exposing (Game)
import Messages exposing (Msg)


subscriptions : Game -> Sub Msg
subscriptions model =
  Sub.none

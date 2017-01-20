module Main exposing (main)

import Html exposing (Html, program)

import Messages exposing (Msg)
import Models exposing (Game, init)
import View exposing (view)
import Update exposing (update)
import Subscriptions exposing (subscriptions)


main : Program Never Game Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

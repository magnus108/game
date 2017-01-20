module View exposing (view)

--insert Routes...

import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)

-- insert routes børe også fixe denne store expose
import Models exposing (Game(..))
import Messages exposing (Msg(..))


view : Game -> Html Msg
view game =
  div []
    [ page game ]


page : Game -> Html Msg
page game =
  case game of
    NoGame ->
      noGame

    NimGame nim ->
      nimGame

    WonGame ->
      wonGame


--noGame : Game -> Html Msg overvej
noGame : Html Msg
noGame =
  div []
    [ text "noGame" ]


nimGame : Html Msg
nimGame =
  div []
    [ text "nimGame" ]


wonGame : Html Msg
wonGame =
  div []
    [ text "wonGame" ]

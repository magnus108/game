module View exposing (view)

--insert Routes...

import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)

-- insert routes børe også fixe denne store expose
import Models exposing (Game(..))
import Messages exposing (Msg(..))

import Nim.Models exposing (Nim)
import Nim.View


view : Game -> Html Msg
view game =
  div []
    [ page game ]


page : Game -> Html Msg
page game =
  case game of
    NimGame nim ->
      nimGame nim

    WonGame ->
      wonGame


--noGame : Game -> Html Msg overvej
nimGame : Nim -> Html Msg
nimGame nim =
  Nim.View.view nim |> Html.map NimMsg


wonGame : Html Msg
wonGame =
  div []
    [ text "wonGame" ]

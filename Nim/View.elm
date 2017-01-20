module Nim.View exposing (view)

import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)

import Nim.Models exposing (Nim)
import Nim.Messages exposing (Msg(..))


view : Nim -> Html Msg
view nim =
  div []
    [ heaps nim ]


heaps : Nim -> Html Msg
heaps nim =
  text "bob"
  --Heaps.List.view (Nim.heaps nim) |> Html.map HeapsMsg

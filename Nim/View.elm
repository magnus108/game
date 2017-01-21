module Nim.View exposing (view)


import Html exposing (Html, div, text)

import Nim.Models exposing (Nim)
import Nim.Messages exposing (Msg(..))

import Nim.Heaps.List


view : Nim -> Html Msg
view nim =
  div []
    [ heaps nim ]


heaps : Nim -> Html Msg
heaps nim =
  Nim.Heaps.List.view (Nim.Models.heaps nim) |> Html.map HeapsMsg

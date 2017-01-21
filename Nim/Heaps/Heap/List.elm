module Nim.Heaps.Heap.List exposing (view, take)


import Html exposing (Html, div, span, text, button)
import Html.Events exposing (onClick)

import ListZipper

import Nim.Heaps.Heap.Models exposing (Heap)
import Nim.Heaps.Heap.Messages exposing (Msg(..))
import Nim.Heaps.Heap.Match exposing (Match)


view : Heap -> Html Msg
view heap =
  div []
    [ list heap ]


list : Heap -> Html Msg
list heap =
  div []
    (List.map row (ListZipper.toList heap))


row : Match -> Html Msg
row match =
  span []
    [ text (toString match) ]


take : Heap -> Html Msg
take heap =
  button [ onClick Take ] [text "Take!"]

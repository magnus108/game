module Nim.Heaps.List exposing (view, take)


import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)

import ListZipper

import Nim.Heaps.Models exposing (Heaps)
import Nim.Heaps.Messages exposing (Msg(..))

import Nim.Heaps.Heap.Models exposing (Heap)
import Nim.Heaps.Heap.List


view : Heaps -> Html Msg
view heaps =
  div []
    [ nav heaps
    , list heaps
    ]


nav : Heaps -> Html Msg
nav heaps =
  div []
    [ button [ onClick Left ] [ text "Left" ]
    , button [ onClick Right ] [ text "Right" ]
    --fair nok .. men måske bør de andre splittes så? kan tilføje up down
    , take heaps
    ]


list : Heaps -> Html Msg
list heaps =
  div []
    ( List.map row (ListZipper.toList heaps) )


row : Heap -> Html Msg
row heap =
  div []
    [ Nim.Heaps.Heap.List.view heap |> Html.map HeapMsg ]


take : Heaps -> Html Msg
take heaps =
  div []
    [ Nim.Heaps.Heap.List.take (ListZipper.current heaps) |> Html.map HeapMsg ]

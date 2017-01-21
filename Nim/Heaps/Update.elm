module Nim.Heaps.Update exposing (update)

import Maybe.Extra exposing ((<|>))

import ListZipper

import Nim.Heaps.Messages exposing (Msg(..))
import Nim.Heaps.Models exposing (Heaps)

import Nim.Heaps.Heap.Update


update : Msg -> Maybe Heaps -> (Maybe Heaps, Cmd Msg)
update msg heaps =
  case msg of
    Left ->
      ( Maybe.map ListZipper.safeLeft heaps, Cmd.none )

    Right ->
      ( Maybe.map ListZipper.safeRight heaps, Cmd.none )

    HeapMsg subMsg ->
      let
        ( maybeHeap, cmd ) =
          Nim.Heaps.Heap.Update.update subMsg
            <| ( Maybe.map ListZipper.current heaps )

        maybeHeaps =
          Maybe.map2 ListZipper.replace maybeHeap heaps
      in
        --inducing superbadness
        -- also fix cmd.
        case heaps of
          Nothing -> (Nothing, Cmd.none)
          Just heeeaps ->
            ( maybeHeaps <|> ListZipper.remove heeeaps, Cmd.none )

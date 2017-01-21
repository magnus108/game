module Nim.Heaps.Heap.Update exposing (update)


import ListZipper

import Nim.Heaps.Heap.Messages exposing (Msg(..))
import Nim.Heaps.Heap.Models exposing (Heap)


update : Msg -> Maybe Heap -> (Maybe Heap, Cmd Msg )
update msg maybeHeap =
  case msg of
    Take ->
      --induce badness
      case maybeHeap of
        Nothing ->
          (Nothing, Cmd.none)

        Just heeap ->
          ( ListZipper.remove heeap, Cmd.none )

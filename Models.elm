module Models exposing (Game(..), init, wonGame, nimGame, toNim)
-- expoing GAME(..) fix

import Messages exposing (Msg)

import Nim.Models exposing (Nim)

--move init
import ListZipper
import Nim.Models
import Nim.Players.Models
import Nim.Heaps.Heap.Match

match = Nim.Heaps.Heap.Match.init
heap = ListZipper.init match |> ListZipper.insert match |> ListZipper.insert match
heaps = ListZipper.init heap |> ListZipper.insert heap |> ListZipper.insert heap
players = Nim.Players.Models.init 312
nim = Nim.Models.init heaps players



--move game module
type Game
  = NimGame Nim
  | WonGame


wonGame : Game
wonGame =
  WonGame


toNim : Game -> Maybe Nim
toNim game =
  case game of
    NimGame nim ->
      Just nim

    _ ->
      Nothing


nimGame : Nim -> Game
nimGame nim =
  NimGame nim


initialModel : Game
initialModel =
  NimGame nim


initialCommands : Cmd Msg
initialCommands =
  Cmd.none


init : (Game, Cmd Msg)
init =
  (initialModel, initialCommands)

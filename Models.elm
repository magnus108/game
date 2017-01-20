module Models exposing (Game(..), init, wonGame, nimGame, toNim)
-- expoing GAME(..) fix

import Messages exposing (Msg)

import Nim.Models exposing (Nim)


--move these
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
  wonGame


initialCommands : Cmd Msg
initialCommands =
  Cmd.none


init : (Game, Cmd Msg)
init =
  (initialModel, initialCommands)

module Models exposing (Game(..), init)
-- expoing GAME(..) fix

import Messages exposing (Msg)

import Nim.Models exposing (Nim)


type Game
  = NoGame
  | NimGame Nim
  | WonGame


initialModel : Game
initialModel =
  NoGame


initialCommands : Cmd Msg
initialCommands =
  Cmd.none


init : (Game, Cmd Msg)
init =
  (initialModel, initialCommands)

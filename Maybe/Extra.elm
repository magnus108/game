module Maybe.Extra exposing ((<|>), mapDefault)


(<|>) : Maybe a -> Maybe a -> Maybe a
(<|>) ma mb =
    case ma of
        Nothing ->
            mb

        Just _ ->
            ma


mapDefault : b -> (a -> b) -> Maybe a -> b
mapDefault d f m =
  Maybe.withDefault d (Maybe.map f m)

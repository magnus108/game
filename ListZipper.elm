module ListZipper exposing (..)


type ListZipper a
  = ListZipper (List a) a (List a)

--should this be here
($>) = flip Maybe.map

-- Are these kinds of functions a good idea?
isLeftMost : ListZipper a -> Bool
isLeftMost xs =
  List.isEmpty (previous xs)


isRightMost : ListZipper a -> Bool
isRightMost xs =
  List.isEmpty (remaining xs)


map : (a -> b) -> ListZipper a -> ListZipper b
map f (ListZipper ls x rs) =
  ListZipper (List.map f ls) (f x) (List.map f rs)


map2 : (a -> b) -> (a -> b) -> ListZipper a -> ListZipper b
map2 f g (ListZipper ls x rs) =
  ListZipper (List.map f ls) (g x) (List.map f rs)


map3 : (a -> b) -> (a -> b) -> (a -> b) -> ListZipper a -> ListZipper b
map3 f g h (ListZipper ls x rs) =
  ListZipper (List.map f ls) (g x) (List.map h rs)


mapf3 : (a -> b -> c) -> a -> a -> a -> ListZipper b -> ListZipper c
mapf3 f a b c (ListZipper ls x rs) =
  ListZipper (List.map (f a) ls) (f b x) (List.map (f c) rs)


init : a -> ListZipper a
init x =
  ListZipper [] x []


toList : ListZipper a -> List a
toList (ListZipper ls x rs) =
  List.reverse ls ++ (x :: rs)


fromList : List a -> Maybe (ListZipper a)
fromList xs =
  case xs of
    [] ->
      Nothing

    x::xs ->
      Just (ListZipper [] x xs)


previous : ListZipper a -> List a
previous (ListZipper ls _ _) = ls


current : ListZipper a -> a
current (ListZipper _ x _) = x


remaining : ListZipper a -> List a
remaining (ListZipper _ _ rs) = rs


replace : a -> ListZipper a -> ListZipper a
replace y (ListZipper ls x rs) =
  ListZipper ls y rs


right : ListZipper a -> Maybe (ListZipper a)
right xs =
  case xs of
    ListZipper ls x (r::rs) ->
      Just (ListZipper (x::ls) r rs)

    _ ->
      Nothing


safeRight : ListZipper a -> ListZipper a
safeRight xs =
  withRollBack right xs


left : ListZipper a -> Maybe (ListZipper a)
left xs =
  case xs of
    ListZipper (l::ls) x rs ->
      Just (ListZipper ls l (x::rs))

    _ ->
      Nothing


safeLeft : ListZipper a -> ListZipper a
safeLeft xs =
  withRollBack left xs


insert : a -> ListZipper a -> ListZipper a
insert a (ListZipper ls x rs) =
  ListZipper (a::ls) x rs


remove : ListZipper a -> Maybe (ListZipper a)
remove xs =
  case xs of
    ListZipper [] _ (r::rs) ->
      Just (ListZipper [] r rs)

    ListZipper (l::ls) _ rs ->
      Just (ListZipper ls l rs)

    _ ->
      Nothing


count : ListZipper a -> Int
count (ListZipper ls _ rs) =
  List.length ls + 1 + (List.length rs)


withRollBack : (a -> Maybe a) -> a -> a
withRollBack f x =
  case f x of
    Just y ->
      y

    Nothing ->
      x

module Main exposing (..)

import Html exposing (text)


main =
    text (toString result)


add a b =
    a + b


result =
    1 |> add 2 |> add 3

module Main exposing (..)

import Html exposing (text)


main =
    result |> strcat "Result is " |> text


add a b =
    a + b


num =
    1


result =
    num
        |> add 2
        |> add 3
        |> add 4
        |> toString


strcat a b =
    a ++ b

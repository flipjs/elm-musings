module Main exposing (..)

import Html exposing (..)
import String exposing (..)


type alias Person =
    { name : String, age : Int }


person : Person
person =
    { name = "felipe", age = 34 }


triple : String -> String
triple =
    repeat 3


view : Person -> Html msg
view p =
    div []
        [ p.name
            |> toUpper
            |> (\s -> s ++ ", ")
            |> triple
            |> text
        ]


main : Html msg
main =
    view person

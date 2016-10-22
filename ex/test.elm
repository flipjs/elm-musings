module Main exposing (..)

import Html exposing (..)


main : Html a
main =
    text "Hello"


type Msg
    = Increment Int
    | Decrement Int
    | Reset


update : Msg -> Msg
update msg =
    case msg of
        Increment num ->
            let
                test =
                    msg
            in
                test

        _ ->
            msg

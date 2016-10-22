module Main exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)


main : Program Never
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { count : Int
    }


init : ( Model, Cmd Msg )
init =
    ( Model 0, Cmd.none )


type Msg
    = Increment Int
    | Decrement Int
    | Reset


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment count ->
            let
                result =
                    model.count + count
            in
                ( Model result, Cmd.none )

        Decrement count ->
            let
                result =
                    model.count - count
            in
                ( Model result, Cmd.none )

        Reset ->
            ( Model 0, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions msg =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ model.count |> toString |> (++) "Count: " |> text ]
        , button [ onClick (Increment 10) ] [ text "Increment" ]
        , button [ onClick (Decrement 10) ] [ text "Decrement" ]
        , button [ onClick Reset ] [ text "Reset" ]
        ]

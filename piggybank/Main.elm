module Main exposing (..)

import Html exposing (Html, text, div, button)
import Html.App as App
import Html.Events exposing (onClick)


main =
    App.beginnerProgram
        { model = model
        , update = update
        , view = view
        }


type alias Model =
    Int


model : Model
model =
    0


type Msg
    = AddCoin
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCoin ->
            model + 1

        Clear ->
            0


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text ("Piggy Bank: " ++ (toString model) ++ " coins") ]
        , button [ onClick AddCoin ] [ text "Add coin" ]
        , button [ onClick Clear ] [ text "Clear" ]
        ]

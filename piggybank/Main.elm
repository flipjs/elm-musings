module Main exposing (..)

import Html exposing (Html, h3, text, div, button, input)
import Html.App as App
import Html.Attributes exposing (type', value, style)
import Html.Events exposing (onClick, onInput)
import String exposing (toInt)


main : Program Never
main =
    App.beginnerProgram
        { model = model
        , update = update
        , view = view
        }


type alias Model =
    { coins : Int
    , input : Int
    , error : Maybe String
    }


model : Model
model =
    Model 0 0 Nothing


type Msg
    = AddCoins
    | Input String
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCoins ->
            { model
                | coins = model.coins + model.input
                , input = 0
            }

        Input val ->
            case toInt val of
                Ok input ->
                    { model
                        | input = input
                        , error = Nothing
                    }

                Err err ->
                    { model
                        | input = 0
                        , error = Just err
                    }

        Clear ->
            Model 0 0 Nothing


view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ text ("Piggy Bank: " ++ (toString model.coins) ++ " coins") ]
        , input
            [ type' "text"
            , onInput Input
            , value
                (if model.input == 0 then
                    ""
                 else
                    toString model.input
                )
            ]
            []
        , div [] [ text (Maybe.withDefault "" model.error) ]
        , button [ type' "button", onClick AddCoins ] [ text "Add coins" ]
        , button [ onClick Clear ] [ text "Clear" ]
        , div [] [ text (toString model) ]
        ]

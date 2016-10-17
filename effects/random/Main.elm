module Main exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Random


main : Program Never
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { face1 : Int
    , face2 : Int
    }


init : ( Model, Cmd Msg )
init =
    ( Model 1 1, Cmd.batch [ generate NewFace1, generate NewFace2 ] )


type Msg
    = Roll
    | NewFace1 Int
    | NewFace2 Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Cmd.batch [ generate NewFace1, generate NewFace2 ] )

        NewFace1 face1 ->
            ( { model | face1 = face1 }, Cmd.none )

        NewFace2 face2 ->
            ( { model | face2 = face2 }, Cmd.none )


generate : (Int -> Msg) -> Cmd Msg
generate msg =
    Random.generate msg (Random.int 1 6)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Roll Dice" ]
        , h2 [] [ text ("Dice 1: " ++ (toString model.face1)) ]
        , h2 [] [ text ("Dice 2: " ++ (toString model.face2)) ]
        , button [ onClick Roll ] [ text "Roll" ]
        ]

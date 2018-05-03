module Count exposing (..)

import Html exposing (Html, div, text, program, button)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


-- Model


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )



-- Message


type Msg
    = Increment Int
    | Decrement Int



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment num ->
            ( model + num, Cmd.none )

        Decrement num ->
            ( model - num, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "text-align", "center" )
            , ( "margin", "100px auto" )
            ]
        ]
        [ div []
            [ button [ onClick (Decrement 1) ] [ text "-1" ]
            , text <| toString model
            , button [ onClick (Increment 1) ] [ text "+1" ]
            ]
        , div []
            [ button [ onClick (Decrement 2) ] [ text "-2" ]
            , text <| toString model
            , button [ onClick (Increment 2) ] [ text "+2" ]
            ]
        , div []
            [ button [ onClick (Decrement 3) ] [ text "-3" ]
            , text <| toString model
            , button [ onClick (Increment 3) ] [ text "+3" ]
            ]
        ]



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- Main


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

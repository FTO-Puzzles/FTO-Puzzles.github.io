module PasswordPuzzle exposing (Model)

import Browser
import Dict exposing (update)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


type alias Model =
    { password : String
    , solution : String
    , opacity : String
    , incorrect_opacity : String
    }


initialModel : Model
initialModel =
    { password = ""
    , solution = "50415353574F5244"
    , opacity = "0"
    , incorrect_opacity = "0"
    }


{--}
view : Model -> Html Msg
view model =
    div []
        [ div [ class "nav-bar" ] [ div [ class "title" ] [ text "FTO-Puzzles" ] ]
        , div [ class "content-wrapper" ]
            [ div [ class "password-wrapper" ]
                [ div [ class "prompt" ] [ text "Please enter the password: " ]
                , input [ class "password", type_ "password", onInput SavePassword, value model.password ] []
                , div [ class "submit-button" ] [ button [ type_ "submit", onClick CheckPassword ] [ text "Enter" ] ]
                , div [ class "incorrect", style "opacity" model.incorrect_opacity ] [ text "incorrect password" ]
                ]
            , div [ class "hint" ] [ text "Hint: the password is PASSWORD" ]
            , div [ class "fire" ]
                [ div [ class "flames", style "opacity" model.opacity ]
                    [ div [ class "flame" ] []
                    , div [ class "flame" ] []
                    , div [ class "flame" ] []
                    , div [ class "flame" ] []
                    ]
                , div [ class "logs", class "log1" ] []
                , div [ class "logs", class "log2" ] []
                , div [ class "latin", style "opacity" model.opacity ] [ text "(in latin)" ]
                ]
            ]
        ]


type Msg
    = CheckPassword
    | SavePassword String



{-
   view : Model -> Html msg
   view user =
       div []
           [ h1 [] [ text "Sign up" ]
           , Html.form []
               [ div []
                   [ text "Name"
                   , input [ id "name", type_ "text" ] []
                   ]
               , div []
                   [ text "Email"
                   , input [ id "email", type_ "email" ] []
                   ]
               , div []
                   [ text "Password"
                   , input [ id "password", type_ "password" ] []
                   ]
               , div []
                   [ button [ type_ "submit" ]
                       [ text "Create my account" ]
                   ]
               ]
           ]

-}


update : Msg -> Model -> Model
update message model =
    case message of
        CheckPassword ->
            let
                incorrect_opacity =
                    if model.password == model.solution then
                        "0.0"

                    else
                        "1.0"

                opacity =
                    if model.password == model.solution then
                        "1.0"

                    else
                        "0.0"
            in
            { model | opacity = opacity, password = "", incorrect_opacity = incorrect_opacity }

        SavePassword password ->
            { model | password = password }


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

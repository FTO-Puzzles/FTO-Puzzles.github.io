module PasswordPuzzle exposing (Model)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Model =
    { password : String
    , loggedIn : Bool
    }


initialModel : Model
initialModel =
    { password = ""
    , loggedIn = False
    }


{--}
view : Model -> Html msg
view model =
    div []
        [ div [ class "nav-bar" ] [ text "FTO-Puzzles" ]
        , div [ class "content-wrapper" ]
            [ div [ class "password-wrapper" ]
                [ div [ class "prompt" ] [ text "Please enter the password: " ]
                , input [ class "password", type_ "password" ] []
                , div [ class "submit-button" ] [ button [ type_ "submit" ] [ text "Enter" ] ]
                ]
            ]
        , div [ class "hint" ] [ text "Hint: the password is PASSWORD" ]
        ]



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


main : Html msg
main =
    view initialModel

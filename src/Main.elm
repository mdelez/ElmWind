module Main exposing (main)

import Browser
import Html exposing (Html, a, button, div, form, text)
import Html.Attributes as Attr exposing (action, class, classList, href, id, method, tabindex, type_)
import Html.Attributes.Aria exposing (ariaExpanded, ariaHasPopup, ariaHidden, ariaLabelledby, role)
import Html.Events exposing (onClick)
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr exposing (clipRule, d, fill, fillRule, viewBox)


type DropdownStatus
    = Open
    | Closed


type alias Model =
    { dropdownStatus : DropdownStatus }


view : Model -> Html Msg
view model =
    viewDropDown model


viewDropDown : Model -> Html Msg
viewDropDown model =
    div [ class "center" ]
        [ div [ class "relative inline-block text-left" ]
            [ viewDropDownButton
            , viewDropDownMenu model
            ]
        ]


viewDropDownButton : Html Msg
viewDropDownButton =
    div []
        [ button
            [ type_ "button"
            , class "inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500"
            , id "menu-button"
            , ariaExpanded "true"
            , ariaHasPopup "true"
            , onClick DropdownButtonClicked
            ]
            [ text "Options"
            , svg
                [ SvgAttr.class "-mr-1 ml-2 h-5 w-5"
                , viewBox "0 0 20 20"
                , fill "currentColor"
                , ariaHidden True
                ]
                [ path
                    [ fillRule "evenodd"
                    , d "M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                    , clipRule "evenodd"
                    ]
                    []
                ]
            ]
        ]



-- Dropdown menu, show/hide based on menu state.
--     Entering: "transition ease-out duration-100"
--       From: "transform opacity-0 scale-95"
--       To: "transform opacity-100 scale-100"
--     Leaving: "transition ease-in duration-75"
--       From: "transform opacity-100 scale-100"
--       To: "transform opacity-0 scale-95"


viewDropDownMenu : Model -> Html msg
viewDropDownMenu model =
    if model.dropdownStatus == Open then
        div
            [ class "origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none"
            , class "dropdownMenu open"
            , role "menu"
            , Attr.attribute "aria-orientation" "vertical"
            , ariaLabelledby "menu-button"
            , tabindex -1
            ]
            [ div
                [ class "py-1"
                , role "none"
                ]
                [ a
                    [ href "#"
                    , class "text-gray-700 block px-4 py-2 text-sm"
                    , role "menuitem"
                    , tabindex -1
                    , id "menu-item-0"
                    ]
                    [ text "Account Settings" ]
                , a
                    [ href "#"
                    , class "text-gray-700 block px-4 py-2 text-sm"
                    , role "menuitem"
                    , tabindex -1
                    , id "menu-item-1"
                    ]
                    [ text "Support" ]
                , a
                    [ href "#"
                    , class "text-gray-700 block px-4 py-2 text-sm"
                    , role "menuitem"
                    , tabindex -1
                    , id "menu-item-2"
                    ]
                    [ text "License" ]
                , form
                    [ method "POST"
                    , Attr.action "#"
                    , role "none"
                    ]
                    [ button
                        [ type_ "submit"
                        , class "text-gray-700 block w-full text-left px-4 py-2 text-sm"
                        , role "menuitem"
                        , tabindex -1
                        , id "menu-item-3"
                        ]
                        [ text "Sign out" ]
                    ]
                ]
            ]

    else
        div [ class "dropdownMenu" ] []


init : () -> ( Model, Cmd msg )
init _ =
    ( { dropdownStatus = Closed }, Cmd.none )


type Msg
    = DropdownButtonClicked


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DropdownButtonClicked ->
            case model.dropdownStatus of
                Open ->
                    ( { model | dropdownStatus = Closed }, Cmd.none )

                Closed ->
                    ( { model | dropdownStatus = Open }, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

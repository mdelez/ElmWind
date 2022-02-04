module Dropdown exposing (main)

import Browser
import Html exposing (Html, a, button, div, form, text)
import Html.Attributes as Attr exposing (action, class, classList, href, id, method, tabindex, type_)
import Html.Attributes.Aria exposing (ariaExpanded, ariaHasPopup, ariaHidden, ariaLabelledby, role)
import Html.Events exposing (onClick, onMouseEnter)
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr exposing (clipRule, d, fill, fillRule, viewBox)
import Json.Decode exposing ( Decoder
        , decodeString
        , field
        , int
        , list
        , map2
        , string
        , succeed
        )
import Debug exposing (log)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Decode exposing (bool)
type DropdownStatus
    = Open
    | Closed


type alias Model =
    { dropdownStatus : DropdownStatus
    , hoveredItem : String
    , input : Input
    }

type alias Option =
    { text : String
    , is_button : Bool
    }
type alias Input  = 
    { header : String
    , options : List Option
    }

view : Model -> Html Msg
view model =
    viewDropDown model


viewDropDown : Model -> Html Msg
viewDropDown model =
    div [ class "center" ]
        [ div [ class "relative inline-block text-left" ]
            [ viewDropDownButton model
            , viewDropDownMenu model
            ]
        ]


viewDropDownButton : Model -> Html Msg
viewDropDownButton model =
    div []
        [ button
            [ type_ "button"
            , class "inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500"
            , id "menu-button"
            , ariaExpanded "true"
            , ariaHasPopup "true"
            , onClick DropdownButtonClicked
            ]
            [ text model.input.header
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


viewDropDownMenu : Model -> Html Msg
viewDropDownMenu model =
    if model.dropdownStatus == Open then
        div
            [ class "origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none"
            , class "dropdown-menu open"
            , role "menu"
            , Attr.attribute "aria-orientation" "vertical"
            , ariaLabelledby "menu-button"
            , tabindex -1
            ] 
            [ div
                [ class "py-1"
                , role "none"
                ]
                (List.indexedMap (viewOption model) model.input.options)
                {-[ a
                    [ href "#"
                    , class "text-gray-700 block px-4 py-2 text-sm"
                    , class "menu-item"
                    , classList
                        [ ("text-gray-900", model.hoveredItem == "menu-item-0")
                        , ("bg-gray-100", model.hoveredItem == "menu-item-0")
                        ]
                    , role "menuitem"
                    , tabindex -1
                    , id "menu-item-0"
                    , onMouseEnter (ItemHovered "menu-item-0")
                    ]
                    [ text "Option 1" ]
                , a
                    [ href "#"
                    , class "text-gray-700 block px-4 py-2 text-sm"
                    , class "menu-item"
                    , classList
                        [ ("text-gray-900", model.hoveredItem == "menu-item-1")
                        , ("bg-gray-100", model.hoveredItem == "menu-item-1")
                        ]
                    , role "menuitem"
                    , tabindex -1
                    , id "menu-item-1"
                    , onMouseEnter (ItemHovered "menu-item-1")
                    ]
                    [ text "Option 2" ]
                , a
                    [ href "#"
                    , class "text-gray-700 block px-4 py-2 text-sm"
                    , class "menu-item"
                    , classList
                        [ ("text-gray-900", model.hoveredItem == "menu-item-2")
                        , ("bg-gray-100", model.hoveredItem == "menu-item-2")
                        ]
                    , role "menuitem"
                    , tabindex -1
                    , id "menu-item-2"
                    , onMouseEnter (ItemHovered "menu-item-2")
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
                        , class "menu-item"
                        , classList
                        [ ("text-gray-900", model.hoveredItem == "menu-item-3")
                        , ("bg-gray-100", model.hoveredItem == "menu-item-3")
                        ]
                        , role "menuitem"
                        , tabindex -1
                        , id "menu-item-3"
                        , onMouseEnter (ItemHovered "menu-item-3")
                        ]
                        [ text "Sign out" ]
                    ]
                ]-}
            ]
    else
        div [ class "dropdown-menu" ] []

viewOption: Model -> Int -> Option -> Html Msg
viewOption model index option = 
    if option.is_button then
        form
                [ method "POST"
                    , Attr.action "#"
                    , role "none"
                ]
                [ button
                    [ type_ "submit"
                        , class "text-gray-700 block w-full text-left px-4 py-2 text-sm"
                        , class "menu-item"
                        , classList
                        [ ("text-gray-900", model.hoveredItem == "menu-item-" ++ String.fromInt(index))
                            , ("bg-gray-100", model.hoveredItem == "menu-item-" ++ String.fromInt(index))
                        ]
                        , role "menuitem"
                        , tabindex -1
                        , id ("menu-item-" ++ String.fromInt(index))
                        , onMouseEnter (ItemHovered ("menu-item-" ++ String.fromInt(index)))
                    ]
                    [ text option.text ]
                ]
    else
        a
            [ href "#"
                , class "text-gray-700 block px-4 py-2 text-sm"
                , class "menu-item"
                , classList
                    [ ("text-gray-900", model.hoveredItem == "menu-item-" ++ String.fromInt(index))
                        , ("bg-gray-100", model.hoveredItem == "menu-item-" ++ String.fromInt(index))
                    ]
                , role "menuitem"
                , tabindex -1
                , id ("menu-item-" ++ String.fromInt(index))
                , onMouseEnter (ItemHovered ("menu-item-" ++ String.fromInt(index)))
            ]
            [ text option.text ]

listDecoder : Json.Decode.Decoder (List Option)
listDecoder = 
    Json.Decode.list optionDecoder
optionDecoder : Json.Decode.Decoder Option
optionDecoder =
    Json.Decode.map2 Option
    (field "text" string)
    (field "is_button" bool)
inputDecoder: Json.Decode.Decoder Input
inputDecoder  = 
    Json.Decode.map2 Input
    (field "header" string)
    (field "options" listDecoder)
buildInput: String -> Input
buildInput input =
    case (Json.Decode.decodeString inputDecoder input) of
        Ok res ->
            res
        _ ->
            ({header = input, options = []})
init : String -> ( Model, Cmd msg )
init input =
    ( { input = (buildInput input), dropdownStatus = Closed, hoveredItem = "" }, Cmd.none )

type Msg
    = DropdownButtonClicked
    | ItemHovered String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DropdownButtonClicked ->
            case model.dropdownStatus of
                Open ->
                    ( { model | dropdownStatus = Closed, hoveredItem = "" }, Cmd.none )

                Closed ->
                    ( { model | dropdownStatus = Open }, Cmd.none )

        ItemHovered id ->
            ( { model | hoveredItem = id }, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


main : Program String Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

module Main exposing (main)

import Html exposing (button, div, text)
import Html.Attributes as Attr exposing (id, type_)
import Html.Attributes.Aria exposing (ariaExpanded, ariaHasPopup, ariaHidden)
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr exposing (clipRule, d, fill, fillRule, viewBox)


view model =
    div [ Attr.class "relative inline-block text-left" ]
        [ div []
            [ button
                [ type_ "button"
                , Attr.class "inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500"
                , id "menu-button"
                , ariaExpanded "true"
                , ariaHasPopup "true"
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
        ]


main =
    view "no model yet"

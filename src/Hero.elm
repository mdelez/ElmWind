module Hero exposing (main)

import Browser
import Html exposing (Html, a, button, div, form, h1, img, main_, nav, p, span, text)
import Html.Attributes as Attr exposing (action, alt, class, classList, href, id, method, src, tabindex, type_)
import Html.Attributes.Aria exposing (ariaExpanded, ariaHasPopup, ariaHidden, ariaLabel, ariaLabelledby, role)
import Html.Events exposing (onClick, onMouseEnter)
import Svg exposing (defs, path, pattern, rect, svg)
import Svg.Attributes as SvgAttr exposing (clipRule, d, fill, fillRule, height, patternUnits, stroke, strokeLinecap, strokeLinejoin, strokeWidth, viewBox, width, x, y)

type MobileMenuStatus
    = Open
    | Closed

type alias Model =
    { mobileMenuStatus : MobileMenuStatus }


view : Model -> Html Msg
view model =
    div
        [ class "relative bg-gray-50 overflow-hidden" ]
        [ div
            [ class "hidden sm:block sm:absolute sm:inset-y-0 sm:h-full sm:w-full"
            , ariaHidden True
            ]
            [ div
                [ class "relative h-full max-w-7xl mx-auto" ]
                [ svg
                    [ SvgAttr.class "absolute right-full transform translate-y-1/4 translate-x-1/4 lg:translate-x-1/2"
                    , width "404"
                    , height "784"
                    , fill "none"
                    , viewBox "0 0 404 784"
                    ]
                    [ Svg.defs []
                        [ Svg.pattern
                            [ SvgAttr.id "f210dbf6-a58d-4871-961e-36d5016a0f49"
                            , x "0"
                            , y "0"
                            , width "20"
                            , height "20"
                            , patternUnits "userSpaceOnUse"
                            ]
                            [ Svg.rect
                                [ x "0"
                                , y "0"
                                , width "4"
                                , height "4"
                                , SvgAttr.class "text-gray-200"
                                , fill "currentColor"
                                ]
                                []
                            ]
                        ]
                    , Svg.rect
                        [ width "404"
                        , height "784"
                        , fill "url(#f210dbf6-a58d-4871-961e-36d5016a0f49)"
                        ]
                        []
                    ]
                , svg
                    [ SvgAttr.class "absolute left-full transform -translate-y-3/4 -translate-x-1/4 md:-translate-y-1/2 lg:-translate-x-1/2"
                    , width "404"
                    , height "784"
                    , fill "none"
                    , viewBox "0 0 404 784"
                    ]
                    [ Svg.defs []
                        [ Svg.pattern
                            [ SvgAttr.id "5d0dd344-b041-4d26-bec4-8d33ea57ec9b"
                            , x "0"
                            , y "0"
                            , width "20"
                            , height "20"
                            , patternUnits "userSpaceOnUse"
                            ]
                            [ Svg.rect
                                [ x "0"
                                , y "0"
                                , width "4"
                                , height "4"
                                , SvgAttr.class "text-gray-200"
                                , fill "currentColor"
                                ]
                                []
                            ]
                        ]
                    , Svg.rect
                        [ width "404"
                        , height "784"
                        , fill "url(#5d0dd344-b041-4d26-bec4-8d33ea57ec9b)"
                        ]
                        []
                    ]
                ]
            ]
        , div
            [ class "relative pt-6 pb-16 sm:pb-24" ]
            [ div []
                [ div
                    [ class "max-w-7xl mx-auto px-4 sm:px-6" ]
                    [ nav
                        [ class "relative flex items-center justify-between sm:h-10 md:justify-center"
                        , ariaLabel "Global"
                        ]
                        [ div
                            [ class "flex items-center flex-1 md:absolute md:inset-y-0 md:left-0"
                            ]
                            [ div
                                [ class "flex items-center justify-between w-full md:w-auto" ]
                                [ a
                                    [ href "#" ]
                                    [ span
                                        [ class "sr-only" ]
                                        [ text "Workflow" ]
                                    , img
                                        [ class "h-8 w-auto sm:h-10"
                                        , src "https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg"
                                        , alt ""
                                        ]
                                        []
                                    ]
                                , div
                                    [ class "-mr-2 flex items-center md:hidden" ]
                                    [ button
                                        [ type_ "button"
                                        , class "bg-gray-50 rounded-md p-2 inline-flex items-center justify-center text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500"
                                        , ariaExpanded "false"
                                        , onClick MobileMenuButtonClicked
                                        ]
                                        [ span
                                            [ class "sr-only" ]
                                            [ text "Open main menu" ]
                                        , {- Heroicon name: outline/menu -}
                                          svg
                                            [ SvgAttr.class "h-6 w-6"
                                            , fill "none"
                                            , viewBox "0 0 24 24"
                                            , stroke "currentColor"
                                            , ariaHidden True
                                            ]
                                            [ path
                                                [ strokeLinecap "round"
                                                , strokeLinejoin "round"
                                                , strokeWidth "2"
                                                , d "M4 6h16M4 12h16M4 18h16"
                                                ]
                                                []
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        , div
                            [ class "hidden md:flex md:space-x-10" ]
                            [ a
                                [ href "#"
                                , class "font-medium text-gray-500 hover:text-gray-900"
                                ]
                                [ text "Product" ]
                            , a
                                [ href "#"
                                , class "font-medium text-gray-500 hover:text-gray-900"
                                ]
                                [ text "Features" ]
                            , a
                                [ href "#"
                                , class "font-medium text-gray-500 hover:text-gray-900"
                                ]
                                [ text "Marketplace" ]
                            , a
                                [ href "#"
                                , class "font-medium text-gray-500 hover:text-gray-900"
                                ]
                                [ text "Company" ]
                            ]
                        , div
                            [ class "hidden md:absolute md:flex md:items-center md:justify-end md:inset-y-0 md:right-0" ]
                            [ span
                                [ class "inline-flex rounded-md shadow" ]
                                [ a
                                    [ href "#"
                                    , class "inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md text-indigo-600 bg-white hover:bg-gray-50"
                                    ]
                                    [ text "Log in" ]
                                ]
                            ]
                        ]
                    ]
                , viewMobileMenu model
                ]
            , main_
                [ class "mt-16 mx-auto max-w-7xl px-4 sm:mt-24" ]
                [ div
                    [ class "text-center" ]
                    [ h1
                        [ class "text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl" ]
                        [ span
                            [ class "block xl:inline"
                            ]
                            [ text "Data to enrich your" ]
                        , span
                            [ class "block text-indigo-600 xl:inline"
                            ]
                            [ text " online business" ]
                        ]
                    , p
                        [ class "mt-3 max-w-md mx-auto text-base text-gray-500 sm:text-lg md:mt-5 md:text-xl md:max-w-3xl"
                        ]
                        [ text "Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui lorem cupidatat commodo. Elit sunt amet fugiat veniam occaecat fugiat aliqua." ]
                    , div
                        [ class "mt-5 max-w-md mx-auto sm:flex sm:justify-center md:mt-8" ]
                        [ div
                            [ class "rounded-md shadow" ]
                            [ a
                                [ href "#"
                                , class "w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 md:py-4 md:text-lg md:px-10"
                                ]
                                [ text "Get started" ]
                            ]
                        , div
                            [ class "mt-3 rounded-md shadow sm:mt-0 sm:ml-3" ]
                            [ a
                                [ href "#"
                                , class "w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-indigo-600 bg-white hover:bg-gray-50 md:py-4 md:text-lg md:px-10"
                                ]
                                [ text "Live demo" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


viewMobileMenu : Model -> Html Msg
viewMobileMenu model =
    if model.mobileMenuStatus == Open then
        div
            [ class "absolute z-10 top-0 inset-x-0 p-2 transition transform origin-top-right md:hidden"
            ]
            [ div
                [ class "rounded-lg shadow-md bg-white ring-1 ring-black ring-opacity-5 overflow-hidden"
                ]
                [ div
                    [ class "px-5 pt-4 flex items-center justify-between"
                    ]
                    [ div []
                        [ img
                            [ class "h-8 w-auto"
                            , src "https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg"
                            , alt ""
                            ]
                            []
                        ]
                    , div
                        [ class "-mr-2"
                        ]
                        [ button
                            [ type_ "button"
                            , class "bg-white rounded-md p-2 inline-flex items-center justify-center text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500"
                            , onClick CloseMobileMenuButtonClicked
                            ]
                            [ span
                                [ class "sr-only"
                                ]
                                [ text "Close menu" ]
                            , {- Heroicon name: outline/x -}
                            svg
                                [ SvgAttr.class "h-6 w-6"
                                , fill "none"
                                , viewBox "0 0 24 24"
                                , stroke "currentColor"
                                , ariaHidden True
                                ]
                                [ path
                                    [ strokeLinecap "round"
                                    , strokeLinejoin "round"
                                    , strokeWidth "2"
                                    , d "M6 18L18 6M6 6l12 12"
                                    ]
                                    []
                                ]
                            ]
                        ]
                    ]
                , div
                    [ class "px-2 pt-2 pb-3"
                    ]
                    [ a
                        [ href "#"
                        , class "block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50"
                        ]
                        [ text "Product" ]
                    , a
                        [ href "#"
                        , class "block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50"
                        ]
                        [ text "Features" ]
                    , a
                        [ href "#"
                        , class "block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50"
                        ]
                        [ text "Marketplace" ]
                    , a
                        [ href "#"
                        , class "block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50"
                        ]
                        [ text "Company" ]
                    ]
                , a
                    [ href "#"
                    , class "block w-full px-5 py-3 text-center font-medium text-indigo-600 bg-gray-50 hover:bg-gray-100"
                    ]
                    [ text "Log in" ]
                ]
            ]
    else
        div [] []

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd msg )
init _ =
    ( { mobileMenuStatus = Closed }, Cmd.none )

type Msg
    = MobileMenuButtonClicked
    | CloseMobileMenuButtonClicked

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MobileMenuButtonClicked ->
            case model.mobileMenuStatus of
                Open ->
                    ( { model | mobileMenuStatus =  Closed }, Cmd.none )
                Closed ->
                    ( { model | mobileMenuStatus =  Open }, Cmd.none )
        CloseMobileMenuButtonClicked ->
            ( { model | mobileMenuStatus = Closed }, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none

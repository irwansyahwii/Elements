ANIMATION_DURATION = 200

SCREEN_WIDTH = 1024
SCREEN_HEIGHT = 768

class MainMenuScreen
    constructor: () ->
        @view = Ti.UI.createView()        

        @buttonHome = Ti.UI.createButton
            backgroundImage: 'MainMenu-HomeButton.png'
            width: 412/2
            height: 1536/2

        @view.add @buttonHome

        @buttonAbout = Ti.UI.createButton
            backgroundImage: 'MainMenu-AboutButton.png'
            width: 406/2
            height: 1536/2

        @view.add @buttonAbout

        @buttonLocation = Ti.UI.createButton
            backgroundImage: 'MainMenu-LocationButton.png'
            width: 410/2
            height: 1536/2

        @view.add @buttonLocation

        @buttonFloorplan = Ti.UI.createButton
            backgroundImage: 'MainMenu-FloorplanButton.png'
            width: 412/2
            height: 1536/2

        @view.add @buttonFloorplan

        @buttonGallery = Ti.UI.createButton
            backgroundImage: 'MainMenu-GalleryButton.png'
            width: 408/2
            height: 1536/2

        @view.add @buttonGallery

        @onButtonClicked = null

        

    init: () =>
        @buttonHome.left = 0
        @buttonHome.top = -@buttonHome.height
        @buttonHome.addEventListener "click", @menuButtonClicked
        @buttonHome.button_id = 0

        @buttonAbout.left = @buttonHome.width + @buttonHome.left
        @buttonAbout.top = @buttonAbout.height + 1
        @buttonAbout.addEventListener "click", @menuButtonClicked
        @buttonAbout.button_id = 1

        @buttonLocation.left = @buttonAbout.width + @buttonAbout.left
        @buttonLocation.top = -@buttonLocation.height
        @buttonLocation.addEventListener "click", @menuButtonClicked
        @buttonLocation.button_id = 2

        @buttonFloorplan.left = @buttonLocation.width + @buttonLocation.left
        @buttonFloorplan.top = @buttonFloorplan.height + 1
        @buttonFloorplan.addEventListener "click", @menuButtonClicked
        @buttonFloorplan.button_id = 3

        @buttonGallery.left = @buttonFloorplan.width + @buttonFloorplan.left
        @buttonGallery.top = @buttonGallery.height + 1
        @buttonGallery.addEventListener "click", @menuButtonClicked
        @buttonGallery.button_id = 3

        @

    menuButtonClicked:(e) =>
        if e.source.button_id isnt 0
            @animateOutHomeButton()
            # @animateOutLocationAndGallery()
            setTimeout =>
                    if @onButtonClicked isnt null
                        @onButtonClicked(e.source.button_id)
                , ANIMATION_DURATION*5

    animateOutLocationButton: () =>
        @buttonLocation.animate
            top: @buttonLocation.height + 1
            duration: ANIMATION_DURATION
            , =>
                # @animateOutFloorplanButton()


    animateOutAboutButton: () =>
        @buttonAbout.animate
            top: @buttonAbout.height + 1
            duration: ANIMATION_DURATION
            , =>
                @animateOutLocationButton()


    animateOutFloorplanButton: () =>
        @buttonFloorplan.animate
            top: @buttonFloorplan.height + 1
            duration: ANIMATION_DURATION
            , =>
                @animateOutAboutButton()


    animateOutGalleryButton: () =>
        @buttonGallery.animate
            top: @buttonGallery.height + 1
            duration: ANIMATION_DURATION
            , =>
                @animateOutFloorplanButton()

    animateOutHomeButton: () =>
        @buttonHome.animate
            top: @buttonHome.height + 1
            duration: ANIMATION_DURATION
            , =>
                @animateOutGalleryButton()

    animateInLocationButton: () =>
        @buttonLocation.animate
            top: 0
            duration: ANIMATION_DURATION
            , =>
                # @animateInFloorplanButton()


    animateInAboutButton: () =>
        @buttonAbout.animate
            top: 0
            duration: ANIMATION_DURATION
            , =>
                @animateInLocationButton()


    animateInFloorplanButton: () =>
        @buttonFloorplan.animate
            top: 0
            duration: ANIMATION_DURATION
            , =>
                @animateInAboutButton()


    animateInGalleryButton: () =>
        @buttonGallery.animate
            top: 0
            duration: ANIMATION_DURATION
            , =>
                @animateInFloorplanButton()

    animateInHomeButton: () =>
        @buttonHome.animate
            top: 0
            duration: ANIMATION_DURATION
            , =>
                @animateInGalleryButton()

    play: () =>
        @animateInHomeButton()


module.exports = MainMenuScreen
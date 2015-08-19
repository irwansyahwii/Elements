SCREEN_HEIGHT = 768

BUTTON_TOP = 0

class TopMenuBar
    constructor: () ->
        @view = Ti.UI.createView
            height:114/2

        @buttonHome = Ti.UI.createButton
            backgroundImage: 'ToolbarMenu-HomeButton.png'
            width: 410/2
            height: 114/2
            button_id: 0

        @view.add @buttonHome

        @buttonAbout = Ti.UI.createButton
            backgroundImage: 'ToolbarMenu-AboutButton.png'
            width: 410/2
            height: 114/2
            button_id: 1

        @view.add @buttonAbout

        @buttonLocation = Ti.UI.createButton
            backgroundImage: 'ToolbarMenu-LocationButton.png'
            width: 410/2
            height: 114/2
            button_id: 2

        @view.add @buttonLocation

        @buttonFloorplan = Ti.UI.createButton
            backgroundImage: 'ToolbarMenu-FloorplanButton.png'
            width: 410/2
            height: 114/2
            button_id: 3

        @view.add @buttonFloorplan

        @buttonGallery = Ti.UI.createButton
            backgroundImage: 'ToolbarMenu-GalleryButton.png'
            width: 410/2
            height: 114/2
            button_id: 4

        @view.add @buttonGallery

        @onButtonClicked = null

    addClickListener: (btn) =>
        btn.addEventListener "click", =>
            if @onButtonClicked isnt null
                @onButtonClicked(btn.button_id)

    init: () =>
        @buttonHome.left = 0
        @buttonHome.top = BUTTON_TOP

        @buttonAbout.left = @buttonHome.width
        @buttonAbout.top = BUTTON_TOP

        @buttonLocation.left = @buttonAbout.width + @buttonAbout.left
        @buttonLocation.top = BUTTON_TOP

        @buttonFloorplan.left = @buttonLocation.width + @buttonLocation.left
        @buttonFloorplan.top = BUTTON_TOP

        @buttonGallery.left = @buttonFloorplan.width + @buttonFloorplan.left
        @buttonGallery.top = BUTTON_TOP

        @addClickListener @buttonHome
        @addClickListener @buttonAbout
        @addClickListener @buttonGallery
        @addClickListener @buttonFloorplan
        @addClickListener @buttonGallery

        @



    play: () =>



        

module.exports = TopMenuBar
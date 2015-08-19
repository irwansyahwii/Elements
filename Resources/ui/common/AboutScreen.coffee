ImageScreen = require("/ui/common/ImageScreen")

class AboutScreen
    constructor:() ->
        @view = Ti.UI.createScrollableView()
            # backgroundColor: "red"
            # layout: "horizontal"
            # contentWidth: "auto"
            # contentHeight: "auto"
            # showVerticalScrollIndicator: true
            # showHorizontalScrollIndicator: true

        @image_screens = []


        for i in [1..5]
            img_info = 
                file_name: "About-Content#{i}.png"
                width: 2048/2
                height: 1422/2
            img_screen = new ImageScreen(img_info).init()

            @image_screens.push(img_screen.view)


        @view.views = @image_screens

        @currentViewIndex = 0

        @view.addEventListener "scrollend", @onScrollEnd

    onScrollEnd: () =>
        if @view.currentPage isnt @currentViewIndex
            @currentViewIndex = @view.currentPage
            @getCurrentView().controller.play()


    relayout: () =>

    init: () =>

        @

    getCurrentView: () =>
        for v in @view.views
            v.controller.reset()
        return @view.views[@view.currentPage]

    play: () =>
        


            




module.exports = AboutScreen
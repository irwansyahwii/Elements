# Intro1 = require("/ui/common/Intro1")
# Intro2 = require("/ui/common/Intro2")

DELAY_BETWEEN_IMAGES = 3000
FADEOUT_DURATION = 3000

class IntroScreen
    constructor: () ->
        @view = Ti.UI.createView()

        @images = []
        @image_views = []


        for i in [1..5]
            @images.push "Intro-Content#{i}.png"

            opacity = 0
            if i == 1
                opacity = 1

            @image_view = Ti.UI.createImageView
                image: @images[i-1]
                width: 2048/2
                height: 1536/2
                left: 0
                top: 0
                opacity: opacity

            @image_views.push @image_view


            @view.add @image_view


        @view.addEventListener "click", @onMainViewClicked

        @onExit = null

        @current_image_index = 0
        @previous_image_index = 0

        @stop_animation = false

    raiseOnExit: () =>
        if @onExit isnt null
            @onExit()

    onMainViewClicked: () =>
        @stop_animation = true
        @view.getParent().remove(@view)
        @raiseOnExit()

    rotateImages: () =>
        if @stop_animation
            return

        @current_image_index++

        if @current_image_index >= @images.length
            @current_image_index = 0            

        prev_image = @image_views[@previous_image_index]
        prev_image.animate
            curve: Ti.UI.ANIMATION_CURVE_EASE_OUT
            opacity: 0
            duration: FADEOUT_DURATION
            , =>


        current_image_view = @image_views[@current_image_index]
        @previous_image_index = @current_image_index
        current_image_view.animate
            curve: Ti.UI.ANIMATION_CURVE_EASE_OUT
            opacity: 1
            duration: FADEOUT_DURATION
            , =>
                setTimeout =>
                        @rotateImages()
                    , DELAY_BETWEEN_IMAGES

    play: () =>
         setTimeout =>
                @rotateImages()
            , DELAY_BETWEEN_IMAGES


module.exports = IntroScreen
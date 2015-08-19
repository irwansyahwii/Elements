class SitePlanScreen
    constructor: (image) ->
        @view = Ti.UI.createScrollView
            maxZoomScale: 2.0

        @backgroundImage = Ti.UI.createImageView
            image: image.file_name
            width: image.width
            height: image.height
            left: 0
            top: 0

        @view.add @backgroundImage

    init: () =>
        @

    play: () =>

    relayout: () =>

module.exports = SitePlanScreen
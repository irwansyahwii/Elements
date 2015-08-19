FirstView = require('ui/common/IntroScreen')
MainMenuScreen = require("ui/common/MainMenuScreen")
ScreenWithBottomMenu = require("ui/common/ScreenWithBottomMenu")
# FullScreenGallery = require("ui/common/FullScreenGallery")

class ApplicationWindow

    showNormalScreenFlow: (self) =>
        firstView = new FirstView()
        firstView.onExit = =>            

            mainMenuScreen = new MainMenuScreen().init()      

            mainMenuScreen.onButtonClicked = (button_id) =>
                topBarScreen = new ScreenWithBottomMenu().init()
                topBarScreen.onDoubleTapped = (eventInfo)=>
                    if eventInfo.event_type is "GALLERY"
                        eventData = eventInfo.event_data
                        console.log eventInfo
                        fullscreenGallery = new FullScreenGallery().init()   
                        fullscreenGallery.setEventData(eventData)
                        self.add fullscreenGallery
                        fullscreenGallery.play()

                topBarScreen.onDayView = (image) =>

                topBarScreen.logoButtonClicked = =>
                    mainMenuScreen.view.remove topBarScreen.view
                    mainMenuScreen.play()

                # self.add topBarScreen
                mainMenuScreen.view.add topBarScreen.view
                topBarScreen.play()
                topBarScreen.click button_id

            self.add mainMenuScreen
            mainMenuScreen.play()

        self.add(firstView)
        firstView.play()
        
        
        return self        

    showEmergencyScreenFlow: (self) =>
        mainMenuScreen = new MainMenuScreen().init()      

        # mainMenuScreen.onButtonClicked = (button_id) =>
        #     topBarScreen = new ScreenWithBottomMenu().init()
        #     topBarScreen.onDoubleTapped = (eventInfo)=>
        #         if eventInfo.event_type is "GALLERY"
        #             eventData = eventInfo.event_data
        #             console.log eventInfo
        #             fullscreenGallery = new FullScreenGallery().init()   
        #             fullscreenGallery.setEventData(eventData)
        #             self.add fullscreenGallery
        #             fullscreenGallery.play()

        #     topBarScreen.onDayView = (image) =>

        #     topBarScreen.logoButtonClicked = =>
        #         mainMenuScreen.view.remove topBarScreen.view
        #         mainMenuScreen.play()

        #     # self.add topBarScreen
        #     mainMenuScreen.view.add topBarScreen.view
        #     topBarScreen.play()
        #     topBarScreen.click button_id

        self.add mainMenuScreen
        mainMenuScreen.play()

        return self

    constructor: () ->    
    
        self = Ti.UI.createWindow
            backgroundColor:'#ede0c8'
            orientationModes : [Ti.UI.LANDSCAPE_LEFT, Ti.UI.LANDSCAPE_RIGHT]
            statusBarStyle : Titanium.UI.iPhone.StatusBar.LIGHT_CONTENT
            fullscreen:true
        
        
        return @showNormalScreenFlow(self)
        
    

    



module.exports = ApplicationWindow

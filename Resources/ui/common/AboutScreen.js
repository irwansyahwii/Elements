// Generated by CoffeeScript 1.9.2
(function() {
  var AboutScreen, ImageScreen,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  ImageScreen = require("/ui/common/ImageScreen");

  AboutScreen = (function() {
    function AboutScreen() {
      this.play = bind(this.play, this);
      this.getCurrentView = bind(this.getCurrentView, this);
      this.init = bind(this.init, this);
      this.relayout = bind(this.relayout, this);
      this.onScrollEnd = bind(this.onScrollEnd, this);
      var i, img_info, img_screen, j;
      this.view = Ti.UI.createScrollableView();
      this.image_screens = [];
      for (i = j = 1; j <= 5; i = ++j) {
        img_info = {
          file_name: "About-Content" + i + ".png",
          width: 2048 / 2,
          height: 1422 / 2
        };
        img_screen = new ImageScreen(img_info).init();
        this.image_screens.push(img_screen.view);
      }
      this.view.views = this.image_screens;
      this.currentViewIndex = 0;
      this.view.addEventListener("scrollend", this.onScrollEnd);
    }

    AboutScreen.prototype.onScrollEnd = function() {};

    AboutScreen.prototype.relayout = function() {};

    AboutScreen.prototype.init = function() {
      return this;
    };

    AboutScreen.prototype.getCurrentView = function() {};

    AboutScreen.prototype.play = function() {};

    return AboutScreen;

  })();

  module.exports = AboutScreen;

}).call(this);

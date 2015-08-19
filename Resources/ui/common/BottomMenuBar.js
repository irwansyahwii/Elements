// Generated by CoffeeScript 1.9.2
(function() {
  var BUTTON_TOP, SCREEN_HEIGHT, TopMenuBar,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  SCREEN_HEIGHT = 768;

  BUTTON_TOP = 0;

  TopMenuBar = (function() {
    function TopMenuBar() {
      this.play = bind(this.play, this);
      this.init = bind(this.init, this);
      this.addClickListener = bind(this.addClickListener, this);
      this.view = Ti.UI.createView({
        height: 114 / 2
      });
      this.buttonHome = Ti.UI.createButton({
        backgroundImage: 'ToolbarMenu-HomeButton.png',
        width: 410 / 2,
        height: 114 / 2,
        button_id: 0
      });
      this.view.add(this.buttonHome);
      this.buttonAbout = Ti.UI.createButton({
        backgroundImage: 'ToolbarMenu-AboutButton.png',
        width: 410 / 2,
        height: 114 / 2,
        button_id: 1
      });
      this.view.add(this.buttonAbout);
      this.buttonLocation = Ti.UI.createButton({
        backgroundImage: 'ToolbarMenu-LocationButton.png',
        width: 410 / 2,
        height: 114 / 2,
        button_id: 4
      });
      this.view.add(this.buttonLocation);
      this.buttonFloorplan = Ti.UI.createButton({
        backgroundImage: 'ToolbarMenu-FloorplanButton.png',
        width: 410 / 2,
        height: 114 / 2,
        button_id: 3
      });
      this.view.add(this.buttonFloorplan);
      this.buttonGallery = Ti.UI.createButton({
        backgroundImage: 'ToolbarMenu-GalleryButton.png',
        width: 410 / 2,
        height: 114 / 2,
        button_id: 2
      });
      this.view.add(this.buttonGallery);
      this.onButtonClicked = null;
    }

    TopMenuBar.prototype.addClickListener = function(btn) {
      return btn.addEventListener("click", (function(_this) {
        return function() {
          if (_this.onButtonClicked !== null) {
            return _this.onButtonClicked(btn.button_id);
          }
        };
      })(this));
    };

    TopMenuBar.prototype.init = function() {
      this.buttonHome.left = 0;
      this.buttonHome.top = BUTTON_TOP;
      this.buttonAbout.left = this.buttonHome.width;
      this.buttonAbout.top = BUTTON_TOP;
      this.buttonLocation.left = this.buttonAbout.width + this.buttonAbout.left;
      this.buttonLocation.top = BUTTON_TOP;
      this.buttonFloorplan.left = this.buttonLocation.width + this.buttonLocation.left;
      this.buttonFloorplan.top = BUTTON_TOP;
      this.buttonGallery.left = this.buttonFloorplan.width + this.buttonFloorplan.left;
      this.buttonGallery.top = BUTTON_TOP;
      this.addClickListener(this.buttonHome);
      this.addClickListener(this.buttonAbout);
      this.addClickListener(this.buttonGallery);
      this.addClickListener(this.buttonFloorplan);
      this.addClickListener(this.buttonGallery);
      return this;
    };

    TopMenuBar.prototype.play = function() {};

    return TopMenuBar;

  })();

  module.exports = TopMenuBar;

}).call(this);

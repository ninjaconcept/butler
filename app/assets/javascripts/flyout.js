
+function ($) {
  'use strict';

  // FLYOUT CLASS DEFINITION
  // =========================

  var toggle    = '[data-toggle="flyout"]',
      role      = '[data-role="flyout"]',
      flyouts   = [],

  Flyout = function (element, options) {
    this.$element = $(element);
  };

  Flyout.VERSION = '1.0.0';

  Flyout.TRANSITION_DURATION = 300;


  Flyout.prototype.toggle = function (e) {

    var $el = this.$element,
        $parent  = this.$element.parent(),
        $submenu = $parent.find('> ol');

    $parent.toggleClass('active');
    $submenu.slideToggle(this.TRANSITION_DURATION, 'swing', function () {
      $el.trigger('toggled');
    });
    return false;
  };

  Flyout.prototype.show = function (e) {

    var $parent  = this.$element.parent(),
        $submenu = $parent.find('> ol');

    $parent.addClass('active');
    $submenu.show();
    return false;
  };

  Flyout.prototype.hide = function (e) {

    var $parent  = this.$element.parent(),
        $submenu = $parent.find('> ol');

    $parent.removeClass('active');
    $submenu.hide();
    return false;
  };



  // FLYOUT PLUGIN DEFINITION
  // ==========================

  function Plugin(option) {
    return this.each(function () {
      var $this = $(this),
          data  = $this.data('bs.flyout');

      if (!data) {
        var ins = new Flyout(this);
        $this.data('bs.flyout', (data = ins));
        flyouts.push(ins);
      }
      if (typeof option == 'string') data[option]();
    })
  }

  var old = $.fn.flyout

  $.fn.flyout             = Plugin;
  $.fn.flyout.Constructor = Flyout;


  // FLYOUT NO CONFLICT
  // ====================

  $.fn.flyout.noConflict = function () {
    $.fn.flyout = old;
    return this;
  };

  $.flyout = {
    clearMenus: function () {
      $.each(flyouts, function () {
        this.hide();
      });
    }
  };


  $(document).on('click.bs.flyout.data-api', toggle, function (e) {
    e.preventDefault();
    e.stopPropagation
    Plugin.call($(this), 'toggle');
  });

  $(document).on('click.bs.flyout.data-api', role, function (e) {
    e.stopPropagation();
  });

}(jQuery);

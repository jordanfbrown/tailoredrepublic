$.fn.scrollBottom = function () {
  return $(document).height() - this.scrollTop() - this.height();
};

$.fn.exists = function() {
  return this.length > 0;
};

$.fn.tap = function(callback) {
  callback(this);
  return this;
};

String.prototype.capitalize = function() {
  return this.charAt(0).toUpperCase() + this.slice(1);
};

$.fn.showPassword = function (c) {
  // Setup callback object
  var callback = {'fn':null, 'args':{}}
  callback.fn = c;

  // Clones passwords and turn the clones into text inputs
  var cloneElement = function (element) {

    var $element = $(element);

    $clone = $("<input />");

    // Name added for JQuery Validation compatibility
    // Element name is required to avoid script warning.
    $clone.attr({
      'type':'text',
      'class':$element.attr('class'),
      'style':$element.attr('style'),
      'size':$element.attr('size'),
      'tabindex':$element.attr('tabindex')
    });

    return $clone;

  };

  // Transfers values between two elements
  var update = function (a, b) {
    b.val(a.val());
  };

  // Shows a or b depending on checkbox
  var setState = function (checkbox, a, b) {

    if (checkbox.is(':checked')) {
      update(a, b);
      b.show();
      a.hide();
    } else {
      update(b, a);
      b.hide();
      a.show();
    }

  };

  return this.each(function () {

    var $input = $(this),
      $checkbox = $($input.data('typetoggle'));

    // Create clone
    var $clone = cloneElement($input);
    $clone.insertAfter($input);

    // Set callback arguments
    if (callback.fn) {
      callback.args.input = $input;
      callback.args.checkbox = $checkbox;
      callback.args.clone = $clone;
    }


    $checkbox.bind('click', function () {
      setState($checkbox, $input, $clone);
    });

    $input.bind('keyup', function () {
      update($input, $clone)
    });

    $clone.bind('keyup', function () {
      update($clone, $input);

      // Added for JQuery Validation compatibility
      // This will trigger validation if it's ON for keyup event
      $input.trigger('keyup');

    });

    // Added for JQuery Validation compatibility
    // This will trigger validation if it's ON for blur event
    $clone.bind('blur', function () {
      $input.trigger('focusout');
    });

    setState($checkbox, $input, $clone);

    if (callback.fn) {
      callback.fn(callback.args);
    }

  });
};

$.fn.magnifier = function() {
  var $img = $(this).find(".magnify-small");
  var image = new Image();
  image.src = $img.attr("src");

  $(this).find('.magnify-large').css('background', "url('" + image.src + "') no-repeat");
  var that = this;

  $(image).load(function() {
    var native_width = image.width;
    var native_height = image.height;

    $(that).mousemove(function (e) {
      var magnify_offset = $(this).offset();
      var mx = e.pageX - magnify_offset.left;
      var my = e.pageY - magnify_offset.top;

      var imgOffset = $img.offset();
      var imgX = e.pageX - imgOffset.left;
      var imgY = e.pageY - imgOffset.top;

      if (imgX < $img.width() && imgY < $img.height() && imgX > 0 && imgY > 0) {
        $(".magnify-large").fadeIn(100);
      }
      else {
        $(".magnify-large").fadeOut(100);
      }
      
      if ($(".magnify-large").is(":visible")) {
        var rx = Math.round(mx / $(".magnify-small").width() * native_width - $(".magnify-large").width() / 2) * -1;
        var ry = Math.round(my / $(".magnify-small").height() * native_height - $(".magnify-large").height() / 2) * -1;
        var bgp = rx + "px " + ry + "px";
        var px = mx - $(".magnify-large").width() / 2;
        var py = my - $(".magnify-large").height() / 2;
        $(".magnify-large").css({left:px, top:py, backgroundPosition:bgp});
      }
    });
  });

  return this;
};

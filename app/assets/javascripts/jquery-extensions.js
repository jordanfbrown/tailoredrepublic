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

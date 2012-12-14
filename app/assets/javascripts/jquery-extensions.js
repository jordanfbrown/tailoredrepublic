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

$.fn.magnifier = function() {
  var $img = $(this).find(".small");
  var image = new Image();
  image.src = $img.attr("src");

  $(this).find('.large').css('background', "url('" + image.src + "') no-repeat");
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
        $(".large").fadeIn(100);
      }
      else {
        $(".large").fadeOut(100);
      }
      
      if ($(".large").is(":visible")) {
        var rx = Math.round(mx / $(".small").width() * native_width - $(".large").width() / 2) * -1;
        var ry = Math.round(my / $(".small").height() * native_height - $(".large").height() / 2) * -1;
        var bgp = rx + "px " + ry + "px";
        var px = mx - $(".large").width() / 2;
        var py = my - $(".large").height() / 2;
        $(".large").css({left:px, top:py, backgroundPosition:bgp});
      }
    });
  });

  return this;
};

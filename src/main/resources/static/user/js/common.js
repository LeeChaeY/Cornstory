// thwhole-vdlqGbmgl8 [vdlqGbmgl8]
(function() {
  $(function() {
    $(".thwhole-vdlqGbmgl8").each(function() {
      const $block = $(this);
      const $dim = $block.find(".header-dim");
      // Header Scroll
      $(window).on("load scroll", function() {
        const $thisTop = $(this).scrollTop();
        if ($thisTop > 0) {
          $block.addClass("header-top-active");
        } else {
          $block.removeClass("header-top-active");
        }
      });
      // Gnb DecoLine
      $block.find(".header-gnbitem").each(function() {
        const $this = $(this);
        $this.on("mouseover", function() {
          $this.find(".header-gnblink").addClass("on");
        });
        $this.on("mouseout", function() {
          $this.find(".header-gnblink").removeClass("on");
        });
      });
      // Full Gnb
      $block.find(".btn-menu").on("click", function() {
        $block.find(".header-fullmenu-photo").addClass("fullmenu-active");
        $block.find(".header-fullmenu-photo .fullmenu-gnbitem .fullmenu-img").show();
      });
      $block.find(".fullmenu-close").on("click", function() {
        $block.find(".header-fullmenu-photo").removeClass("fullmenu-active");
      });
      // Full Gnb Hover
      $block.find(".fullmenu-gnbitem").each(function() {
        const $this = $(this);
        const thisIndex = $this.index();
        $this.find(".fullmenu-gnblink").on("mouseover", function() {
          $block.find(".fullmenu-gnbitem").removeClass("fullmenu-item-active");
          $this.addClass("fullmenu-item-active");
          // Full Gnb Background Img
          const $headerFullmenu = $block.find(".header-fullmenu-photo");
          const classesToRemove = $headerFullmenu.attr("class").split(" ").filter(function(fuillmenu) {
            return fuillmenu.startsWith("header-fullmenu-bg");
          });
          $headerFullmenu.removeClass(classesToRemove.join(" "));
          $headerFullmenu.addClass("header-fullmenu-bg" + thisIndex);
        });
      });
      // Header Mobile 1Depth Click
      if (window.innerWidth <= 992) {
        $block.find(".header-gnbitem").each(function() {
          const $sublist = $(this).find(".header-sublist");
          if ($sublist.length) {
            $(this).find(".header-gnblink").attr("href", "javascript:void(0);");
          }
        });
      }
    });
  });
})();
// hooms-N53 [lYlQluvFkB]
(function() {
  $(function() {
    $(".hooms-contact-N3").each(function() {
      const $block = $(this);
      // Textarea Count
      $block.find("textarea").on("keyup", function() {
        var contactText = $(this).val();
        if (contactText.length == 0 || contactText == "") {
          $block.find(".contact-text-count").text("0");
        } else {
          $block.find(".contact-text-count").text(contactText.length);
        }
        if (contactText.length > 4000) {
          $(this).val($(this).val().substring(0, 4000));
        }
      });
      // File Cancel Button
      $block.find('.contact-form-file').each(function() {
        const $this = $(this);
        $this.find('.fileset-input').on('change', function() {
          $(this).siblings('.fileset-btn-cancel').show();
        });
        $this.find('.fileset-btn-cancel').on('click', function() {
          $(this).siblings('.fileset-input').val('');
          $(this).hide();
        });
      });
    });
  });
})();;
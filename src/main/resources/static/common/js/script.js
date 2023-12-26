// hooms-N56 [vdlqGbmgl8]
(function() {
  $(function() {
    $(".hooms-N56").each(function() {
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
// hooms-N1 [SAlQg8Ft2x]
(function() {
  $(function() {
    $(".hooms-N1").each(function() {
      const $block = $(this);
      // Swiper
      const swiper = new Swiper(".hooms-N1 .contents-swiper", {
        slidesPerView: 1,
        spaceBetween: 0,
        allowTouchMove: false,
        loop: true,
        autoplay: {
          delay: 5000,
        },
        pagination: {
          el: ".hooms-N1 .swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".hooms-N1 .swiper-button-next",
          prevEl: ".hooms-N1 .swiper-button-prev",
        },
      });
      // Swiper Play, Pause Button
      const pauseButton = $block.find('.swiper-button-pause');
      const playButton = $block.find('.swiper-button-play');
      playButton.hide();
      pauseButton.show();
      pauseButton.on('click', function() {
        swiper.autoplay.stop();
        playButton.show();
        pauseButton.hide();
      });
      playButton.on('click', function() {
        swiper.autoplay.start();
        playButton.hide();
        pauseButton.show();
      });
    });
  });
})();
// hooms-N39 [xQlqGhhsUs]
(function() {
  $(function() {
    $(".hooms-N39").each(function() {
      const $block = $(this);
      // modalSet
      modalSet(".modalset-dim", "#modalSet1", "#modalSet2");

      function modalSet(dim, modalSet1, modalSet2) {
        // Modal Show
        $block.find('.modalset-btn').on('click', function() {
          $block.find(modalSet1).addClass('modalset-active');
          $block.find(dim).fadeIn();
        });
        // Modal Hide
        $block.find('.modalset-dim, .modal-close').on('click', function() {
          $block.find(modalSet1).removeClass('modalset-active');
          $block.find(modalSet2).removeClass('modalset-active');
          $block.find(dim).fadeOut();
        });
        $block.find(modalSet1).find('.btnset-confirm').on('click', function() {
          $block.find(modalSet1).removeClass('modalset-active');
          $block.find(modalSet2).addClass('modalset-active');
        });
        // Modal2 Show
        $block.find(modalSet2).find('.btnset-confirm').on('click', function() {
          $block.find(modalSet2).removeClass('modalset-active');
          $block.find(dim).fadeOut();
        });
      };
    });
  });
})();;
// hooms-N36 [iSLqLSg68L]
(function() {
  $(function() {
    $(".hooms-N36").each(function() {
      const $block = $(this);
      // modalSet
      modalSet(".modalset-dim", "#modalSet1");

      function modalSet(dim, modalSet1) {
        // Modal Show
        $block.find('.modalset-btn').on('click', function() {
          $block.find(modalSet1).addClass('modalset-active');
          $block.find(dim).fadeIn();
        });
        // Modal Hide
        $block.find('.modalset-dim, .modal-close, .btnset-confirm').on('click', function() {
          $block.find(modalSet1).removeClass('modalset-active');
          $block.find(dim).fadeOut();
        });
      };
    });
  });
})();;
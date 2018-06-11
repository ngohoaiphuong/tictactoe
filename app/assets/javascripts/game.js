var gameCore = (function($) {
  function updateBoard(id) {
    var current_turn = gon.global.current_turn;
    $.post(Routes.game_update_game_board_path(id), function(data){
      gon.global.current_turn = data.next_turn;
      $('#row-' + id).addClass(current_turn).addClass('checked');
    });
  }

  function setEvent4EachRow() {
    $(document).on('click', $("[id^=row-]"), function(e) {
      var idStr = $(e.target).attr('id');
      if (idStr && idStr.match(/^row-\d+$/) != null) {
        var idNum = parseInt(idStr.match(/^row-(\d+)$/)[1]) || 0;
        if (idNum > 0 && !$(e.target).hasClass('checked')) {
          updateBoard(idNum);
        }
      }
    })
  }

  function setEventMouse() {
    $("[id^=row-]").hover(function(){
      if(!$(this).hasClass('checked')) {
        $(this).addClass(gon.global.current_turn);
      }
    }, function(){
      if(!$(this).hasClass('checked')) {
        $(this).removeClass(gon.global.current_turn);
      }
    });
  }

  return {
    initialize: function() {
      setEvent4EachRow();
      gameCore.setEventHover();
    },
    setEventHover: function() {
      setEventMouse();
    }
  }
})(jQuery);

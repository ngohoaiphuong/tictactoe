var gameCore = (function($) {
  function setEvent4EachRow() {
    // $("[id^=row-]")
    $(document).on('click', $("[id^=row-]"), function(e) {
      var id = $(e.target).attr('id');
      if (id && id.match(/^row\-\d+$/) != null) {
        console.log(e.target);
      }
    })
  }
  return {
    initialize: function() {
      setEvent4EachRow();
    }
  }
})(jQuery);

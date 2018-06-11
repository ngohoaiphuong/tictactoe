var ModalSystem = (function($) {
  var modal_holder_selector, modal_selector;
  modal_holder_selector = '#modal-holder';
  modal_selector = '.modal';
  return {
    initialize : function() {
      $(document).on('click', 'a[data-modal]', function() {
        var location;
        location = $(this).attr('href');
        $.get(location, function(data) {
          return $(modal_holder_selector).html(data).find(modal_selector).modal('show');
        });
        return false;
      });
      return $(document).on('ajax:success', 'form[data-modal]', function(event, data, status, xhr) {
        var url;
        if (xhr) {
          url = xhr.getResponseHeader('Location');
          if (url) {
            window.location = url;
          } else {
            $('.modal-backdrop').remove();
            $(modal_holder_selector).html(data).find(modal_selector).modal('show');
          }
        } else {

        }
        return false;
      });
    }
  }
})(jQuery);

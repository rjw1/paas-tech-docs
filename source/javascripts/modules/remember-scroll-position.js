(function($, Modules) {
  'use strict';

  Modules.RememberScrollPosition = function RememberScrollPosition() {
    var $scrollingElement;

    this.start = function ($element) {
      $scrollingElement = $element;

      $(window).on('popstate', restoreScrollPosition);
      $scrollingElement.on('scroll', storeScrollPositionInHistoryApi);

      restoreScrollPosition();
    };

    function restoreScrollPosition() {
      if (history.state) {
        $scrollingElement.scrollTop(history.state.scrollTop);
      }
    }

    function storeScrollPositionInHistoryApi() {
      history.replaceState({
        scrollTop: $(this).scrollTop()
      }, "");
    }
  };

})(jQuery, window.GOVUK.Modules);

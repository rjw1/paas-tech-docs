(function($, Modules) {
  'use strict';

  Modules.HighlightedNav = function HighlightedNav() {
    var $tocPane;
    var $contentPane;
    var $anchors;
    var scrollAnimationFrameRequested = false;
    var lastStoredScrollOffset = 0;

    this.start = function start($element) {
      $tocPane = $element.find('.app-pane__toc');
      $contentPane = $element.find('.app-pane__content');
      $anchors = $tocPane.find('a');

      $contentPane.on('scroll', function () {
        debouncingScroll(handleScrollEvent);
      });

      // Popstate is triggered when using the back button to navigate 'within'
      // the page, i.e. changing the anchor part of the URL.
      $(window).on('popstate', function (event) {
        restoreScrollPosition(event.originalEvent.state);
      });

      // Restore state when e.g. using the back button to return to this page
      restoreScrollPosition(history.state);
    };

    function restoreScrollPosition(state) {
      if (state && state.scrollTop) {
        $contentPane.scrollTop(history.state.scrollTop);
      }
    }

    function handleScrollEvent() {
      var firstElement = firstElementInView();

      storeCurrentPositionInHistoryApi(firstElement);
      updateTableOfContentsHighlighting(firstElement);
    }

    function storeCurrentPositionInHistoryApi(firstElementInView) {
      var currentOffset = $contentPane.scrollTop();

      if (Math.abs(lastStoredScrollOffset - currentOffset) > 10) {
        lastStoredScrollOffset = currentOffset;

        history.replaceState(
          { scrollTop: currentOffset },
          "",
          firstElementInView.attr('href')
        );
      }
    }

    function updateTableOfContentsHighlighting(firstElementInView) {
      $anchors.removeClass('toc-link--in-view');

      if (!firstElementInView) {
        return;
      }

      firstElementInView.addClass('toc-link--in-view');
    }

    function firstElementInView() {
      var target = null;

      $($anchors.get().reverse()).each(function checkIfInView(index) {
        if (target) {
          return;
        }

        var $this = $(this);
        var $heading = $contentPane.find($this.attr('href'));

        if ($heading.position().top <= 0) {
          target = $this;
        }
      });

      return target;
    }

    function debouncingScroll(callback) {
      if (!scrollAnimationFrameRequested) {
        requestAnimationFrame(function () {
          scrollAnimationFrameRequested = false;
          callback();
        });
      }

      scrollAnimationFrameRequested = true;
    }
  };
})(jQuery, window.GOVUK.Modules);

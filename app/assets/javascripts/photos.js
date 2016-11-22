$( document ).on('turbolinks:load', function() {
  $("#photos").justifiedGallery({
    rowHeight : 300,
    lastRow : 'nojustify',
    margins : 20
  });
});

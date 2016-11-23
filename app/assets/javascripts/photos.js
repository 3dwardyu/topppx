$( document ).on('turbolinks:load', function() {
  // Uses Justified Gallery to organize photo grid
  $("#photos").justifiedGallery({
    rowHeight : 300,
    lastRow : 'nojustify',
    margins : 20
  });
});

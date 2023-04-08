$(document).on('turbolinks:load', function () {
  var searchBox = $('input#search-box');

  searchBox.on('input', function () {
    var query = searchBox.val();

    $.ajax({
      url: '/search_queries',
      type: 'POST',
      data: {
        query: query,
        authenticity_token: $("meta[name='csrf-token']").attr('content'),
      },
    });
  });
});

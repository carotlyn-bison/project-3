$(document).ready(function() {
  $('.book-search-submit').click(function() {
    bookData = {};
    bookData.title = $('.title-input').val();
    $.ajax({
      type: "GET",
      url: "/books/search",
      data: bookData,
      success: function(data) {
        $('.search-results').empty();
        console.log(data.items);
        loop(data.items)
      },
      error: function(error) {
        console.log('AJAX GET Error: ', error)
      } //end of AJAX GET error
    }) //end of AJAX GET request
  }) //end of book search submit click listener
  const loop = function(arr) {
    arr.forEach(function(thing) {
      let newDiv = $('<div>').addClass('search-result');
      let title = $('<p>');
      title.text(thing.volumeInfo.title);
      newDiv.append(title);
      let author = $('<div>');
      thing.volumeInfo.authors.forEach(function(writer) {
        author.append(writer)
      }) //end of authors forEach
      newDiv.append(author);
      let image = $('<img>')
      image.attr('src', thing.volumeInfo.imageLinks.thumbnail);
      newDiv.append(image);
      let buyLink = $('<a>');
      buyLink.attr('href', thing.saleInfo.buyLink);
      newDiv.append(buyLink);
      let desc = $('<div>');
      desc.text(thing.volumeInfo.description);
      newDiv.append(desc);
      let searchButton = $('<button>')
      searchButton.append(newDiv);
      $('.search-results').append(newDiv);

    })
  } //end of loop function
}) //end of document.ready

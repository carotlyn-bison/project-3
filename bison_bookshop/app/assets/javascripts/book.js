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
        $('.search-results').attr('data-id', data.user_id);
        loop(data.response_data.items);
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
      buyLink.attr('href', thing.saleInfo.buyLink).text('Buy This Book');
      newDiv.append(buyLink);
      let description = $('<div>');
      description.text(thing.volumeInfo.description);
      newDiv.append(description);
      $('.search-results').append(newDiv);
      let save = $('<button>');
      save.text('Add to Bookshelf?').attr('data-id', thing.user_id).click(function() {
        saveBook(title.text, author.text, image.attr('src'), description.text, buyLink.attr('href'), $('.search-results').attr('data-id'));
      }) //end of save function
      newDiv.append(save)
    }); //end of array.forEach
  } //end of loop function
  const saveBook = function(title, author, image, description, buyLink, user_id) {
    $.ajax({
      type: 'POST',
      url: '/books',
      data: {
        title: title,
        author: author,
        image: image,
        description: description,
        buy_link: buyLink,
        user_id: user_id
      },
      success: function(data) {
        window.location.replace('/books/' + data.title);
      },
      error: function(error) {
        console.log('AJAX POST Error: ', error)
      }
    })
  }
}) //end of document.ready

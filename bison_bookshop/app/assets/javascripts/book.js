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
      let author = $('<div>').addClass('writer');
      author.text(thing.volumeInfo.authors[0]);
      newDiv.append(author)
      let image = $('<img>');
      image.attr('src', thing.volumeInfo.imageLinks.thumbnail);
      newDiv.append(image);
      let buyLink = $('<div>');
      if (thing.saleInfo.buyLink) {
        buyLink.html($("<a></a>").attr('href', thing.saleInfo.buyLink).text('Buy This Book'));
      } else {
        buyLink.css('font-style', 'italic').text('Sorry, this book is not available for purchase.');
      }
      newDiv.append(buyLink);
      let description = $('<div>').addClass('description');
      if (thing.volumeInfo.description) {
        description.text(thing.volumeInfo.description);
      } else {
        description.css('font-style', 'italic').text('No description avaliable.');
      }
      newDiv.append(description);
      $('.search-results').append(newDiv);
      let save = $('<button>');
      save.text('Add to Bookshelf?').click(function() {
        saveBook(thing.volumeInfo.title, thing.volumeInfo.authors[0], thing.volumeInfo.imageLinks.thumbnail, thing.volumeInfo.description, thing.saleInfo.buyLink, $('.search-results').attr('data-id'));
      }) //end of save function
      newDiv.append(save)
    }); //end of array.forEach
  } //end of loop function
  const saveBook = function(title, author, image, description, buyLink, user_id) {
    console.log(buyLink);
    $.ajax({
      type: 'POST',
      url: '/books',
      data: {
        book: {
          title: title,
          author: author,
          image: image,
          description: description,
          buy_link: buyLink,
          user_id: user_id
        }
      },
      success: function(data) {
        console.log(data)
      },
      error: function(error) {
        console.log('AJAX POST Error: ', error)
      }
    }) //end of AJAX book POST method
  } //end of saveBook function
}) //end of document.ready

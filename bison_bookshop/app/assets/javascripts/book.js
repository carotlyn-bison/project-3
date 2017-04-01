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
        $('.search-container').css('background-color', 'rgba(0,0,0, 0.5)');
      },
      error: function(error) {
        console.log('AJAX GET Error: ', error)
      } //end of AJAX GET error
    }) //end of AJAX GET request
  }) //end of book search submit click listener
  const loop = function(arr) {
    arr.forEach(function(thing) {
      let newDiv = $('<div>').addClass('search-result');
      let title = $('<div>').addClass('title-div');
      title.text(thing.volumeInfo.title);
      newDiv.append(title);
      let author = $('<div>').addClass('author-div');
      author.text('By: ' + thing.volumeInfo.authors[0]);
      newDiv.append(author)
      let image = $('<div>').addClass('image-div');
      image.html($("<img>").attr('src', thing.volumeInfo.imageLinks.thumbnail));
      newDiv.append(image);
      let buyLink = $('<div>').addClass('buy-link-div');
      if (thing.saleInfo.buyLink) {
        buyLink.append($('<button></button>').html($("<a></a>").attr('href', thing.saleInfo.buyLink).text('Buy This Book')));
      } else {
        buyLink.css('font-style', 'italic').text('Sorry, this book is not available for purchase.');
      }
      newDiv.append(buyLink);
      let description = $('<div>').addClass('description-div');
      if (thing.volumeInfo.description) {
        description.text(thing.volumeInfo.description.substring(0, 200) + '...');
      } else {
        description.css('font-style', 'italic').text('No description avaliable.');
      }
      newDiv.append(description);
      $('.search-results').append(newDiv);
      let save = $('<div>').addClass('save-button-div');
      save.html($('<button></button>').text('Add to Bookshelf?')).click(function() {
        saveBook(thing.volumeInfo.title, thing.volumeInfo.authors[0], thing.volumeInfo.imageLinks.thumbnail, thing.volumeInfo.description, thing.saleInfo.buyLink, $('.search-results').attr('data-id'));
      }) //end of save function
      newDiv.append(save)
    }); //end of array.forEach
  } //end of loop function
  const saveBook = function(title, author, image, description, buyLink, user_id) {
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
        console.log(data);
      },
      error: function(error) {
        console.log('AJAX POST Error: ', error)
      }
    }) //end of AJAX book POST method
  } //end of saveBook function
}) //end of document.ready

//wait for document to be loaded before able to manipulate
$(document).ready(function () {
  loadReviews();
  leaveReview();
  nextBook();
  // previousPage();
})

//create an object
class Review{
  constructor(id, title, content, rating, user_id, book_id){
    this.id = id
    this.title = title
    this.content = content
    this.rating = rating
    this.user_id = user_id
    this.book_id = book_id
  }
}

//prototypes act like instance methods for a new object
//this prototype will take the json object and return html
//to be appended to DOM
Review.prototype.reviewHtml = function(){
  let newHtml = " "
  newHtml += `<li>`
  newHtml += `<b>Review Title:</b> ${this.title} <br>`
  newHtml += `<b>Content:</b>${this.content}<br>`
  newHtml += `<b>Rating:</b>${this.rating}<br>`
  newHtml += `</li>`
  return newHtml
};

//loads reviews via jquery without a refresh
function loadReviews(){
  $("a.reviews_link").on("click", function(e){
    $("a.reviews_link").hide(); //hides load reviews link
    $.get(this.href).success(function(reviews){
      $.each(reviews, function(index, review){
        $("ol.reviews").append(
          "<li>" +
          '<b>' + " " + "Review Title:" + "</b>" + " " + review.title + " " + "<br>" +
          '<b>' + "Content:" + "</b>" + " " + review.content + " " + "<br>" +
          '<b>' + "Rating:" + "</b>" + " " + review.rating + " " +
          // how do i capture username for review???
          "</li>"
        )
      })
    })
    e.preventDefault();
})
};

//post a new review via ajax
function leaveReview(){
  $("form#new_review").on("submit", function(e) {
    const bookId = parseInt($("#review_book_id").attr("value"));
    let pageUrl =`/books/${bookId}/reviews`;
    e.preventDefault();
      $.ajax({
          url: pageUrl,
          data: $(this).serialize(),
          type: "POST",
          dataType: "json",
          success: function(response) {
            let review = new Review(response.book_id, response.title, response.content, response.rating)
            console.log(review)
            $("ol.reviews").append(review.reviewHtml())
            $("form").trigger("reset") //clears form upon submission
          },
      });
  });
}

// function nextBook(){
//   $(function () {
//     $(".js-next").on("click", function() {
//       var nextId = parseInt($(".js-next").attr("data-id")) + 1;
//       $.get("/books/" + nextId, function(data) {
//         $(".bookTitle").text(data["title"]);
//         $(".bookAuthor").text(data["author"]);
//         $(".bookSummary").text(data["summary"]);
//         // re-set the id to current on the link
//         $(".js-next").attr("data-id", data["id"]);
//       });
//     });
//   });
// }

// function previousPage(){
//   $("a.previous").on("click", function (){
//     var bookId = parseInt($("a.next").attr("data-id"));
//     console.log(bookId)
//   })
// }
//

//the DOM is what we currently see when we inspect a page.
//This means that the html can be manipulated without a reload
//this is important because it allows for our data to be appended via ajax or jquery
//to the DOM on the backend without a reload.

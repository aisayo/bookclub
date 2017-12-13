// this sets the index at 0, but how do i get it to start at 1?
let index = 0

//waits for document to be loaded before doing anything
$(document).ready(function () {
  loadReviews();
  leaveReview();
})

//creates an object
class Review{
  constructor(id, title, content, rating, user_id, book_id){
    this.content = content
    this.rating = rating
    this.user_id = user_id
    this.book_id = book_id
    this.id = id
  }
}

//loads reviews via jquery without a refresh
function loadReviews(){
  $("a.reviews_link").on("click", function(e){
    $("a.reviews_link").hide();
    $.get(this.href).success(function(reviews){
      $.each(reviews, function(index, review){
        $("div.reviews").append(
          "<ol>" +
          '<b>' + (index + 1) + "." + " " + "Review Title:" + "</b>" + " " + review.title + " " + "<br>" +
          '<b>' + "Content:" + "</b>" + " " + review.content + " " + "<br>" +
          '<b>' + "Rating:" + "</b>" + " " + review.rating + " " +
          // how do i capture username for review???
          "</ol>"
        )
      })
    })
    e.preventDefault();
})
};

function leaveReview(){
  $("#new_review").on("submit", function(e) {
    const bookId = parseInt($("#review_book_id").attr("value"));
    postUrl =`/books/${bookId}/reviews`;
    e.preventDefault();
      $.ajax({
          url: postUrl,
          data: $(this).serialize(),
          type: "POST",
          dataType: "json",
          success: function(response) {
            console.log(response)
            response = JSON.stringify(response)
            review = new Review(response.title, response.content, response.rating)
            $("div.reviews").append(review)
            console.log(review)
            $("form").trigger("reset") //clears form upon submission
          },
          error: function(xhr, textStatus, errorThrown) {}
      });
  });
}

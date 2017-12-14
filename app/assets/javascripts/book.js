// this sets the index at 0
let index = 0

//wait for document to be loaded before doing anything
$(document).ready(function () {
  loadReviews();
  leaveReview();
})

//create an object
class Review{
  constructor(id, title, content, rating, user_id, book_id){
    this.content = content
    this.title = title
    this.rating = rating
    this.user_id = user_id
    this.book_id = book_id
    this.id = id
  }
}

//loads reviews via jquery without a refresh
function loadReviews(){
  $("a.reviews_link").on("click", function(e){
    $("a.reviews_link").hide(); //hides load reviews link
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

//post a new review via ajax
function leaveReview(){
  $("form#new_review").on("submit", function(e) {
    const bookId = parseInt($("#review_book_id").attr("value"));
    postUrl =`/books/${bookId}/reviews`;
    e.preventDefault();
      $.ajax({
          url: postUrl,
          data: $(this).serialize(),
          type: "POST",
          dataType: "json",
          success: function(response) {
            reviewResponse = JSON.stringify(response)
              // reviewResponse = {"id":159,"title":"dfa","content":"dfa","rating":3,"user_id":2,"book_id":6}
            review = new Review(response.book_id, response.title, response.content, response.rating)
            // console.log(review)
            $("div.reviews").append(response)
            $("form").trigger("reset") //clears form upon submission
          },
          error: function(xhr, textStatus, errorThrown) {}
      });
  });
}

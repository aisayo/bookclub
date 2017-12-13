// this sets the index at 0, but how do i get it to start at 1?
let index = 0

//waits for document to be loaded before doing anything
$(document).ready(function () {
  loadReviews();
  leaveReview();
})

//creates an object
class Review{
  constructor(title, content, rating){ //do I need to construct user_id and ID for recipe?
    this.title = title
    this.content = content
    this.rating = rating
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
          // how do i indent this and number each review((do i want to number each one?))?
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
            response = JSON.stringify(response)
            debugger;
            aysey = new Review(response.title, response.content, response.rating)
            $("div.reviews").append(aysey)
            $("form").trigger("reset")
          },
          error: function(xhr, textStatus, errorThrown) {}
      });
  });
}

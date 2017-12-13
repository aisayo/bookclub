// this sets the index at 0, but how do i get it to start at 1?
let index = 0

$(document).ready(function () {
  loadReviews();
  leaveReview();
})

class Review{
  constructor(title, content, rating){ //do I need to construct user_id and ID for recipe?
    this.title = title
    this.content = content
    this.rating = rating
  }
}

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

function leaveReview(form){
  $("#new_review").on("submit", function(e) {
    const bookId = parseInt($("#review_book_id").attr("value"));
    postUrl =`/books/${bookId}/reviews`; //use interpolation, concate
      $.ajax({
          url: postUrl,
          data: $(this).serialize(),
          type: "POST",
          dataType: "json",
          success: function(response) {
            new Review(title, content, rating)
              $("div.reviews").append(response)
          },
          error: function(xhr, textStatus, errorThrown) {}
      });
      e.preventDefault();
  });
}

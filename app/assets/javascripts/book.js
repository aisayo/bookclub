// this sets the index at 0, but how do i get it to start at 1?
var index = 0

$(document).ready(function () {
  loadReviews();
  leaveReview();
})

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

// function leaveReview(){
//   $("#new_review").on("submit", function(e){
//     $.ajax({
//       type: ($("input[name='method']").val() || this.method),
//       url: this.action,
//       data: this.serialize(),
//       success: function(response){
//         $("div.reviews").append(response)
//       }
//     })
//     e.preventDefault();
//   })
// }

function leaveReview(form){
  $("#new_review").on("submit", function(e) {
    var bookId = parseInt($("#review_book_id").attr("value"));
    postUrl = "/books/" + bookId + "/reviews";
      $.ajax({
          url: postUrl,
          data: $(form).serialize(),
          type: "POST",
          dataType: "json",
          success: function(response) {
              $("div.reviews").append(response)
          },
          error: function(xhr, textStatus, errorThrown) {}
      });
      e.preventDefault();
  });
}

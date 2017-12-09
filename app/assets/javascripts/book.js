// this sets the index at 0, but how do i get it to start at 1?
var index = 0

$(document).on('turbolinks:load', function () {
  loadReviews();
})

function loadReviews(){
  $("a.reviews_link").on("click", function(e){
    $("a.reviews_link").hide();
    $.get(this.href).success(function(reviews){
      $.each(reviews, function(index, review){
        $("div.reviews").append(
          "<li>" +
          '<b>' + (index + 1) + "." + " " + "Review Title:" + "</b>" + " " + review.title + " " + "<br>" +
          // how do i indent this and number each review((do i want to number each one?))?
          '<b>' + "Content:" + "</b>" + " " + review.content + " " + "<br>" +
          '<b>' + "Rating:" + "</b>" + " " + review.rating + " " +
          // how do i capture username for review???
          "</li>"
        )
      })
    })
    e.preventDefault();
})
}

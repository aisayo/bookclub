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
          '<b>' + "Review Title:" + "</b>" + " " + review.title + " " + "<br>" +
          '<b>' + "Content:" + "</b>" + " " + review.content + " " + "<br>" +
          '<b>' + "Rating:" + "</b>" + " " + review.rating + " " +
          "</li>"
        )
      })
    })
    e.preventDefault();
})
}



// e.preventDefault();

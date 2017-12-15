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
            // let reviewResponse = JSON.stringify(response)
              // reviewResponse = {"id":159,"title":"dfa","content":"dfa","rating":3,"user_id":2,"book_id":6}
            let review = new Review(response.book_id, response.title, response.content, response.rating)
            console.log(review)
            $("ol.reviews").append(review.reviewHtml())
            $("form").trigger("reset") //clears form upon submission
          },
      });
  });
}

function nextPage(){
  $("a.next").on("click", function (e){
    e.preventDefault();
    alert("you clicked it!")
  })
}
   // var currentCatId = parseInt($(".js-next").attr("data-id"));
   // $.getJSON("/cats", function(cats){
   //   var currentIndex = cats.map(function(element) {
   //     return element.id;
   //   }).indexOf(currentCatId);
   //   var nextCat = cats[currentIndex+1];
   //   $(".cat-name").text(nextCat.name);
   //   $(".cat-color").text(nextCat.color);
   //   $(".trick-list").empty();
   //   $.each(nextCat.tricks, function(index, trick) {
   //     $(".trick-list").append(
// }

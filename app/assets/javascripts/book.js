$(document).on('turbolinks:load', function () {
    $("a.reviews_link").on("click", function(e){
    alert("you clicked!!!")
    e.preventDefault();
  })
})

$(document).on('turbolinks:load', function () {
    $("a.reviews_link").on("click", function(e){
    $.ajax({
      method: "GET",
      url: "this.href"
    }).done(function(data){
      console.log(data)
    })
    e.preventDefault();
  })
})

$(document).on('turbolinks:load', function () {
    $("a.reviews_link").on("click", function(e){
      console.log(this.href)
      $.get(this.href).success(function(response){
        console.log(response)
      })
      e.preventDefault();
  })
})



// e.preventDefault();

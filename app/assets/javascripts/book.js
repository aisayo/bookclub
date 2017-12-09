$(document).on('turbolinks:load', function () {
    $("a.reviews_link").on("click", function(e){
      $.getJSON(this.href).success(function(reviews){
        $.each(reviews, function(index, review){
          $("div.reviews").append(
            "<li>" +
            "Review Title:" +
            " " +
            review.title + " " +
            "content:" + " " +
            review.content +
            "</li>"
          )
        })
        // var $ol = $('div.reviews ol')
        // $ol.html("")
        // json.forEach(function(review){
        //   $ol.append("<li>" + review.content + "<li>")
        // })
      })
      e.preventDefault();
  })
})



// e.preventDefault();

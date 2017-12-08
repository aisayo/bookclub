# books = Book.create([{
#     title: "Romeo and Juliet",
#     author: "William Shakespeare",
#     summary: "One of Shakespeare's most popular and accessible plays, Romeo and Juliet tells the story of two star-crossed lovers and the unhappy fate that befell them as a result of a long and bitter feud between their families. The play contains some of Shakespeare's most beautiful and lyrical love poetry and is perhaps the finest celebration of the joys of young love ever written. This inexpensive edition includes the complete, unabridged text with explanatory footnotes. Ideal for classroom use, it is a wonderful addition to the home library of anyone wanting to savor one of literature's most sublime paeans to love."
#     }])



      review = Review.create([{
        title: "really good",
        content: "amazing",
        rating: "5",
        user_id: 1,
        book_id: 6
        }])

        review = Review.create([{
          title: "pretty decent",
          content: "pretty ok",
          rating: "3",
          user_id: 2,
          book_id: 6
          }])

          review = Review.create([{
            title: "it was ok",
            content: "not my kind",
            rating: "3",
            user_id: 3,
            book_id: 6
            }])

            review = Review.create([{
              title: "nice book",
              content: "pretty ok",
              rating: "4",
              user_id: 4,
              book_id: 6
              }])


    #
    #
    #
    # user = User.create([{
    #   username: "bookworm2",
    #   email: "bookworm2@123.com",
    #   password: "Lmfao1877!"
    #   }])

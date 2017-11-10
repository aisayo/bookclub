module ReviewsHelper

  def new_review
    @review = Review.create(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end
  
end

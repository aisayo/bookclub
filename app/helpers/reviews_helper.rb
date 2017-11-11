module ReviewsHelper

  def new_review
    @review = current_user.reviews.create(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

end

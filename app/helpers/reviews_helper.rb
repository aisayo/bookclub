module ReviewsHelper

  def new_review
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "Thanks for the review!"
      redirect_to root_path
    else
      render :new
    end
  end

end

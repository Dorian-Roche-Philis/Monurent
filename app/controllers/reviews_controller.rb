class ReviewsController < ApplicationController



  def create
    @review = Review.new(review_params)

    @monument = Monument.find(params[:monument_id])
    @review.user = current_user
    @review.monument = @monument
    authorize @review
    if @review.save
      redirect_to monument_path(@monument)
    else
      render 'monument/show'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def review_params
    params.require(:review).permit(:user, :content, :rating, :monument)
  end
end

class ReviewsController < ApplicationController

  def new
    @monument = Monument.find(params[:monument_id])
    @review = Review.new
    @review.monument_id = @monument
    authorize @review
  end

  def create
    @review = Review.new(review_params)


    @monument = Monument.find(params[:monument_id])
    @user = current_user
    @review.user = @user
    @review.monument = @monument
    authorize @review
    if @review.save

      redirect_to monument_path(@monument)
    else
      render :new
    end
  end

  def edit
  end

  def update

  end

  def destroy

  end

  def review_params
    params.require(:review).permit(:user, :text, :rating, :monument)
  end
end

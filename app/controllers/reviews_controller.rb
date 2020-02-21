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
    @monument = Monument.find(params[:monument_id])
    @review = Review.find(params[:id])
    @review.monument = @monument
    authorize @review
    authorize @monument
    @review.update(review_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to monument_path
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to monument_path(@review.monument)
  end

  def review_params
    params.require(:review).permit(:user, :content, :rating, :monument)
  end
end

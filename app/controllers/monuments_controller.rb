class MonumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  before_action :set_monument, only: [:show, :edit, :update, :destroy]

  def index

    if params[:query].present?
      sql_query = "city ILIKE :query OR name ILIKE :query"
      @monuments = policy_scope(Monument).where(sql_query, query: "%#{params[:query]}%").geocoded
    else
      @monuments = policy_scope(Monument).all.geocoded
    end
    # @monuments = monument.geocoded # returns monument with coordinates

    @markers = @monuments.map do |monument|
      {
        lat: monument.latitude,
        lng: monument.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { monument: monument }),
        image_url: helpers.asset_url('pyramid (1).png')
      }
    end
  end

  def new
    @monument = Monument.new
    @monument.user = current_user

    authorize @monument
  end

  def create
    @monument = Monument.new(monument_params)
    @monument.user = current_user
    authorize @monument
    if @monument.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show

    @booking = Booking.new
    @review = Review.new
    authorize @monument
    @review.monument = @monument
    @review.user = current_user
    authorize @booking
    authorize @review

  end

  def edit
    authorize @monument
  end

  def update
    authorize @monument
    if @monument.update(monument_params)
      redirect_to monument_path(@monument)
    else
      render :edit
    end
  end

  def destroy
    authorize @monument
    @monument.destroy
    redirect_to root_path
    # redirect to dashboard
  end

  private

  def set_monument
    @monument = Monument.find(params[:id])
  end

  def monument_params
    params.require(:monument).permit(:user, :address, :name, :price, :description, :city, photos: [])
  end
end



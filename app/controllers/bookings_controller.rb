class BookingsController < ApplicationController

  def show
    @monument = Monument.find(params[:monument_id])
    @user = current_user
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new

    @booking = Booking.new

  end

  def create

    @booking = Booking.new(booking_params)

    @monument = Monument.find(params[:monument_id])
    @user = current_user

    @booking.user = @user
    @booking.monument = @monument

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end


  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :monument_id)
  end

end

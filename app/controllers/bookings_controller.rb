class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @monument = Monument.find(params[:monument_id])
    @user = current_user
    @booking.user = @user
    @booking.monument = @monument
    authorize @booking
  end

  def new

  end

  def create
    @booking = Booking.new(booking_params)


    @monument = Monument.find(params[:monument_id])
    @user = current_user
    @booking.user = @user
    @booking.monument = @monument
    authorize @booking
    if @booking.save

      redirect_to monument_booking_path(@monument, @booking)
    else
      render 'monuments/show'
    end



  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :monument, :user)
  end

end

class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: :dashboard

  def dashboard
    @bookings = current_user.bookings
    authorize @bookings
  end
end



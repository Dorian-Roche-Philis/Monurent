
module BookingHelper
  def count_days(end_time, start_time)
    Integer(end_time - start_time)
  end


end

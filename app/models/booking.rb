class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :monument
  has_one :review
end

class Monument < ApplicationRecord
  has_many_attached :photos
  has_many :reviews
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :name, uniqueness: true
  # searchkick
end

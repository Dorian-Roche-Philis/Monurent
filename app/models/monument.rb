class Monument < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :name, uniqueness: true
end

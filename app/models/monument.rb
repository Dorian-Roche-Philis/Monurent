class Monument < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :name, uniqueness: true
end

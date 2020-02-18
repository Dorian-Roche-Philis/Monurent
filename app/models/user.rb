class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :monuments, dependent: :destroy

  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

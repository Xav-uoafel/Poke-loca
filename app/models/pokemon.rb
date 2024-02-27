class Pokemon < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  validates :price, presence: true
  validates :services, presence: true
end

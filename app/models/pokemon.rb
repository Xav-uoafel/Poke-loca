class Pokemon < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  validates :price, presence: true
  validates :services, presence: true
end

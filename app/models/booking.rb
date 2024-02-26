class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
  validates :total_price, presence: true
end

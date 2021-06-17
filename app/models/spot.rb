class Spot < ApplicationRecord
  belongs_to :post

  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode
end

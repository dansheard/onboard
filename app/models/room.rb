class Room < ActiveRecord::Base
  # add a relationship between other models
  belongs_to :user

  # validate certain things
  validates :name, presence: true
  validates :address, presence: true
  validates :price_in_pence, presence: true, numericality: { greater_than: 50 }

  # geocoder setup
  geocoded_by :address
  after_validation :geocode

  # add image attachment
end

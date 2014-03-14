class Room < ActiveRecord::Base
  # add a relationship between other models
  belongs_to :user

  # validate certain things
  validates :name, presence: true
  validates :address, presence: true
  validates :price_in_pence, presence: true, 
    numericality: { greater_than: 50 }

  # geocoder setup
  geocoded_by :address
  after_validation :geocode

  # add image attachment
  # in my styles I can use...
  # 720x240 -> either 720 wide or 240 high
  # 720x -> 720 wide and however tall
  # x240 -> however wide and 240px tall
  # 720x240# -> crop to 720 by 240
  has_attached_file :image, styles: { large: "720x240#", medium: "240x240#", 
    thumbnail: "60x60#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

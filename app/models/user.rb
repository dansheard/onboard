class User < ActiveRecord::Base
  # relationships
  has_many :rooms
  has_many :orders

  # validations
  validates :name, presence: true, if: -> { self.provider.nil? }
  validates :email, presence: true, uniqueness: true, if: -> { self.provider.nil? }
  validates :username, presence: true, uniqueness: true, if: -> { self.provider.nil? }

  # gems
  has_secure_password
end

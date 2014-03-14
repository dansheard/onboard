class Order < ActiveRecord::Base
  # relationships (associations)
  belongs_to :room
  belongs_to :user
end

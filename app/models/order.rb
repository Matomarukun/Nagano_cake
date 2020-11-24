class Order < ApplicationRecord
  belongs_to :customer
  has_many :cart_items
  belongs_to :customer
end

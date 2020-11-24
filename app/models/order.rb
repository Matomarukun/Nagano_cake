class Order < ApplicationRecord
  has_many :oder_items
  belongs_to :customer
end

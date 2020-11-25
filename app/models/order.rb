class Order < ApplicationRecord
  belongs_to :customer
  has_many :cart_items
  belongs_to :customer

  enum method_pay:{クレジットカード: 0,銀行振込:1}
end

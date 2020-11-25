class Order < ApplicationRecord
  has_many :oder_items
  belongs_to :customer

  enum method_pay:{クレジットカード: 0,銀行振込:1}
end

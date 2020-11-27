class Order < ApplicationRecord

  enum method_pay:{credit_card: 0, bank: 1}
  belongs_to :customer
  has_many :cart_items
  belongs_to :customer

end

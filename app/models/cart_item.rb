class CartItem < ApplicationRecord


  belongs_to :customer
  belongs_to :item

  validates :amount, numericality: true

  # validates :amount,
  #   numericality:{ only_integer: true, greater_than: 1}
end

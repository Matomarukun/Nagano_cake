class Order < ApplicationRecord

  enum method_pay:{クレジットカード: 0,銀行振込:1}
  enum status:{入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}

  belongs_to :customer
  # has_many :cart_items
  has_many :order_items

  def sum_of_price
    order_sum + shipping
  end

end

class Customer < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :current_password
  has_many :addresses
  has_many :cart_items
  has_many :order

  validates :is_deleted, inclusion: { in: [true, false] }


  with_options presence: true do
    validates :last_name, :first_name, :last_name_kana, :first_name_kana, :address, :email

    with_options numericality: { allow_nil: true } do
      validates :postal_code, :phone_number
    end

    with_options length: { minimum: 6 } do
      validates :password
    end
  end

end

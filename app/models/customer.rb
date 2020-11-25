class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :current_password
  has_many :addresses
  has_many :cart_items

  has_many :order
  validates :is_deleted, inclusion: { in: [true, false] }
  
  

end

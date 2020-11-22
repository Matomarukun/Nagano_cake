class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :current_password
  has_many :addresses


  def name
    "#{@last_name} #{@first_name}"
  end

  def name_kana
    "#{@last_name_kana} #{@first_name_kana}"
  end

end

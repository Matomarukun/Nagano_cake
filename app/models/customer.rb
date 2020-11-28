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

  # 物理削除の代わりにユーザーの`deleted_at`をタイムスタンプで更新
  def soft_delete
    update_attribute(:is_deleted, Time.current)
  end

  # ユーザーのアカウントが有効であることを確認
  def active_for_authentication?
    super && !is_deleted
  end

  # 削除したユーザーにカスタムメッセージを追加します
  def inactive_message
    !is_deleted ? super : :deleted_account
  end


  with_options presence: true do
    validates :last_name, :first_name, :last_name_kana, :first_name_kana, :address, :email

    with_options numericality: { allow_nil: true } do
      validates :postal_code, :phone_number
    end

    # with_options length: { minimum: 6 } do
    #   validates :password
    # end
  end

end

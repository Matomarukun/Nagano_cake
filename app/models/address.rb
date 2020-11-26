class Address < ApplicationRecord

  belongs_to :customer

  # include JpPrefecture
  # jp_prefecture :prefecture_code

  # def prefecture_name
  #   JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  # end

  # def prefecture_name=(prefecture_name)
  #   self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  # end

  with_options presence: true  do
    validates :address, :name

    with_options numericality: { allow_nil: true } do
      validates :postal_code
    end
  end

end

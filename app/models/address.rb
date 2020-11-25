class Address < ApplicationRecord

  belongs_to :customer

  def view_name
    '(' + self.postal_code.to_s + ')' + self.address + self.name
  end

  # include JpPrefecture
  # jp_prefecture :prefecture_code

  # def prefecture_name
  #   JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  # end

  # def prefecture_name=(prefecture_name)
  #   self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  # end




end

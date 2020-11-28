class Address < ApplicationRecord

  belongs_to :customer

  def view_name
    '(' + self.postal_code.to_s + ')' + self.address + self.name
  end

  with_options presence: true  do
    validates :address, :name

    with_options numericality: { allow_nil: true } do
      validates :postal_code
    end
  end

end

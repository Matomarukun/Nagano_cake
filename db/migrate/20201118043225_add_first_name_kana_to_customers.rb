class AddFirstNameKanaToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :First_name_kana, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :address, :string
    add_column :customers, :phone_number, :string
  end
end

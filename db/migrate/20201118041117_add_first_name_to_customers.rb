class AddFirstNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :First_name, :string
    add_column :customers, :last_name_kana, :string
  end
end

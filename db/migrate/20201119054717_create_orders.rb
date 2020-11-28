class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :status, default: 0
      t.integer :order_sum
      t.integer :shipping
      t.integer :method_pay, default: 0
      t.string :name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end

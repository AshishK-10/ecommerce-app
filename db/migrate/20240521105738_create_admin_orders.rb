class CreateAdminOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :customer_email
      t.boolean :fullfilled
      t.float :total
      t.string :address

      t.timestamps
    end
  end
end

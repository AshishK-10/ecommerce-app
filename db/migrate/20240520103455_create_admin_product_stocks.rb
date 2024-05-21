class CreateAdminProductStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :size
      t.float :amount
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

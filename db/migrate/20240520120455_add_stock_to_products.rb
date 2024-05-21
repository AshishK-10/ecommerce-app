class AddStockToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :stock, foreign_key: true
  end
end

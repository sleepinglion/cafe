class CreateProductDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :product_discounts do |t|
      t.references :product, null: false
      t.float :discount_rate, null: false, default: 0
      t.integer :discount_price, null: false, default: 0
      t.boolean :enable, null: false, default: true
    end
  end
end

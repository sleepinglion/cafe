class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :branch, null: false
      t.references :user, null: false
      t.date :last_transaction_date, null: false
      t.integer :total_price, null: false, default: 0
      t.integer :total_discount, null: false, default: 0
      t.integer :total_payment, null: false, default: 0
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :branch,:null=>false
      t.references :user,:null=>false
      t.date :transaction_date,:null=>false
      t.integer :price,:null=>false, :default=>0
      t.integer :discount,:null=>false, :default=>0
      t.integer :payment,:null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
  end
end

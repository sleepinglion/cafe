class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :branch,:null=>false
      t.references :product_category,:null=>false
      t.string :title,:null=>false
      t.integer :order_no,:null=>false, :default=>0
      t.integer :price, :default=>0
      t.integer :product_pictures_count, :null=>false, :default=>0
      t.boolean :display, :null=>false, :default=>true
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
  end
end

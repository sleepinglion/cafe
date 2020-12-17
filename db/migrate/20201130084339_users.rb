class Users < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.references :branch,:null=>false
      t.string :name,:null=>false
      t.string :phone
      t.string :email
      t.string :address
      t.date :birthday
      t.integer :orders_count, :null=>false, :default=>0
      t.integer :accounts_count, :null=>false, :default=>0
      t.boolean :display, :null=>false, :default=>true
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
  end
end

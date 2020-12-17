class Accounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.references :branch,:null=>false
      t.references :account_category,:null=>false
      t.references :user,:null=>true
      t.date :transaction_date, :null=>false
      t.string :refund, :null=>false, :default=>0
      t.integer :cash,:null=>false, :default=>0
      t.integer :credit,:null=>false, :default=>0
      t.integer :point,:null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
  end
end

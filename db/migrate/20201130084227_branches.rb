class Branches < ActiveRecord::Migration[6.0]
  def change
    create_table :branches do |t|
      t.references :company, :null=>false
      t.string :title,:null=>false
      t.boolean :use_cash, :null=>false, :default=>1
      t.boolean :use_credit, :null=>false, :default=>1
      t.boolean :use_point, :null=>false, :default=>1
      t.boolean :use_log, :null=>false, :default=>1
      t.integer :admins_count, :null=>false, :default=>1
      t.integer :sample, :null=>false, :default=>0
      t.integer :users_count, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
  end
end

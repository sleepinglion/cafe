class Branches < ActiveRecord::Migration[6.0]
  def change
    create_table :branches do |t|
      t.references :company, :null=>false
      t.string :title,:null=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps
    end
  end
end

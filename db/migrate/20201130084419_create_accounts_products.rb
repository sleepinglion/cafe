class CreateAccountsProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts_products do |t|
      t.references :account,:null=>false
      t.references :product,:null=>false
      t.boolean :enable, :null=>false, :default=>true
    end
  end
end

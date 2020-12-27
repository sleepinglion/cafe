class CreateAccountsOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts_orders do |t|
      t.references :account,:null=>false
      t.references :order,:null=>false
      t.boolean :enable, :null=>false, :default=>true
    end
  end
end

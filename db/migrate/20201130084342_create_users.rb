class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.references :branch, null: false
      t.string :name, null: false, limit: 60
      t.string :email, limit: 60
      t.string :phone
      t.string :address
      t.date :birthday
      t.integer :orders_count, null: false, default: 0
      t.integer :accounts_count, null: false, default: 0
      t.boolean :enable, null: false, default: true
      t.timestamps
    end

    add_index :users, :email, :unique => true
  end
end

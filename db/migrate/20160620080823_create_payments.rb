class CreatePayments < ActiveRecord::Migration[4.2]
    def change
        create_table :payments do |t|
            t.string :title, null: false, limit:60
            t.integer :branches_count, null: false, default: 0
            t.integer :orders_count, null: false, default: 0
            t.boolean :enable, null: false, default: false
            t.timestamps
        end
    end
end

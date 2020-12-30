class CreateBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :branches do |t|
      t.references :company, null: false
      t.string :title, null: false, limit: 60
      t.integer :admins_count, null: false, default: 1
      t.integer :sample, null: false, default: 0
      t.integer :users_count, null: false, default: 0
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end

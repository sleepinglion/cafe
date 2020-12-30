class CreateAccountCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :account_categories do |t|
      t.string :title, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end

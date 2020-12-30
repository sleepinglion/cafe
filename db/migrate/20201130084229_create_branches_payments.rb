class CreateBranchesPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :branches_payments do |t|
      t.references :branch, null: false
      t.references :payment, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end

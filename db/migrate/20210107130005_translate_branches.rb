class TranslateBranches < ActiveRecord::Migration[6.0]
    def change
        reversible do |dir|
            dir.up do
                Branch.create_translation_table!({ title: :string }, migrate_data: true)
                remove_column :branches, :title
            end

            dir.down do
                Branch.drop_translation_table! migrate_data: true
            end
        end
    end
end

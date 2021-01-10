class TranslateCompanies < ActiveRecord::Migration[6.0]
    def change
        reversible do |dir|
            dir.up do
                Company.create_translation_table!({ title: :string }, migrate_data: true)
                remove_column :companies, :title
            end

            dir.down do
                Company.drop_translation_table! migrate_data: true
            end
        end
    end
end

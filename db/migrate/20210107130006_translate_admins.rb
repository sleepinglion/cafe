class TranslateAdmins < ActiveRecord::Migration[6.0]
    def change
        reversible do |dir|
            dir.up do
                Admin.create_translation_table!({ name: :string }, migrate_data: true)
                remove_column :admins, :name
            end

            dir.down do
                Admin.drop_translation_table! migrate_data: true
            end
        end
    end
end

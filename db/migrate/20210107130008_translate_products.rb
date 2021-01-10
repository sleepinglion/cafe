class TranslateProducts < ActiveRecord::Migration[6.0]
    def change
        reversible do |dir|
            dir.up do
                Product.create_translation_table!({ title: :string }, migrate_data: true)
                remove_column :products, :title
            end

            dir.down do
                Product.drop_translation_table! migrate_data: true
            end
        end
    end
end

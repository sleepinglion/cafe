class TranslateProductCategories < ActiveRecord::Migration[6.0]
    def change
        reversible do |dir|
            dir.up do
                ProductCategory.create_translation_table!({ title: :string }, migrate_data: true)
                remove_column :product_categories, :title
            end

            dir.down do
                ProductCategory.drop_translation_table! migrate_data: true
            end
        end
    end
end

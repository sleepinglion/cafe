class CreateRolesAdmins < ActiveRecord::Migration[6.0]
    def change
        create_table :roles_admins do |t|
            t.references :role, :admin
        end
    end
end

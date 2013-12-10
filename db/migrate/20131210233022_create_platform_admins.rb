class CreatePlatformAdmins < ActiveRecord::Migration
  def change
    create_table :platform_admins do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end

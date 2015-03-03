class CreateMatMemberships < ActiveRecord::Migration
  def change
    create_table :mat_memberships do |t|
      t.integer :material_id
      t.integer :group_id
      t.boolean :is_confirmed
      t.string :requested_by
      t.string :comments

      t.timestamps
    end
  end
end

class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :groupname
      t.string :description
      t.string :owner_email
      t.integer :owner_id
      t.boolean :is_public

      t.timestamps
    end
  end
end

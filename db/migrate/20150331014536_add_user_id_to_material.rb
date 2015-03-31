class AddUserIdToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :user_id, :integer
    add_column :testfiles, :user_id, :integer
  end
end

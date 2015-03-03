class ChangeTestfiles < ActiveRecord::Migration
  def change
	change_table :testfiles do |t|
		t.remove :group
		t.integer :group_id
		t.string :groupname
		t.string :group_owner_id
		t.string :comments
		t.integer :confidence_level		
	end
  end
end

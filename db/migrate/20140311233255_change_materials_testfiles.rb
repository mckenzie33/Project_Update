class ChangeMaterialsTestfiles < ActiveRecord::Migration
  def change
	change_table :materials do |t|
		t.remove :name
		t.remove :type
		t.string :name
		t.string :type
  		t.index [:name, :type]
	end
	change_table :testfiles do |t|
		t.remove :material_id
		t.remove :group
  		t.remove :material
  		t.remove :type
		t.integer :material_id
		t.string :material
		t.string :group
		t.string :type
		t.index [:material_id, :material, :type, :group]
	end
  end
end

class ForeignKeysAndIndexes < ActiveRecord::Migration
  def change
  	add_column :properties, :material_id, :integer
  	add_column :testfiles, :material_id, :integer

  	add_index :properties, :material_id
  	add_index :testfiles, :material_id
  end
end
class AddMatNameToTestfiles < ActiveRecord::Migration
  def change
  	add_column :testfiles, :mat_name, :string
  end
end

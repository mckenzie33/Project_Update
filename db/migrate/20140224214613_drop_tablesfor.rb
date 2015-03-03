class DropTablesfor < ActiveRecord::Migration
  def change
	drop_table :goals
	drop_table :activities
	drop_table :weights
  end
end

class AddDpmFileToDpm < ActiveRecord::Migration
  def change
    add_column :dpms, :filename, :string
  end
end

class AddCommentsToTestfile < ActiveRecord::Migration
  def change
    add_column :testfiles, :comments, :text
  end
end

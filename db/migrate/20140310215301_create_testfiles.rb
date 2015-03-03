class CreateTestfiles < ActiveRecord::Migration
  def change
    create_table :testfiles do |t|
      t.string :material
      t.string :group
      t.string :filename
      t.string :uploaded_by

      t.timestamps
    end
  end
end

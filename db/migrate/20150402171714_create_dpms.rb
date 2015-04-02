class CreateDpms < ActiveRecord::Migration
  def change
    create_table :dpms do |t|

      t.timestamps
    end
  end
end

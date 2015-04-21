class AddGraphNumberToDpms < ActiveRecord::Migration
  def change
    add_column :dpms, :graph_number, :integer
    add_column :dpms, :youngs_modulus, :float
    add_column :dpms, :gauge_length, :float
    add_column :dpms, :necking_point, :float
    add_column :dpms, :fitting_param, :float
    add_column :dpms, :threshold, :integer
  end
end

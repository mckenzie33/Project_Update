class DatabaseOverhaul < ActiveRecord::Migration
  def up
  	#drop_table :groups
  	#drop_table :mat_memberships
  	#rop_table :memberships
    
  	# create_table :properties do |t|
  	#   t.float	:density
  	#   t.float	:elastic_modulus
  	#   t.float	:shear_modulus
  	#   t.float	:poissons_ratio
  	#   t.float	:yield_strength
  	#   t.float	:ultimate_tensile_strength
  	#   t.float	:ultimate_total_elongation
  	#   t.float	:hardness_value
  	#   t.float	:melting_point
  	#   t.float	:thermal_expansion
  	#   t.float	:thermal_conductivity
  	#   t.float	:specific_heat
  	#   t.float	:electrical_resistivity
  	#   t.float :chemical_composition
  	# end

  	remove_column :materials, :density
  	remove_column :materials, :elastic_modulus
  	remove_column :materials, :shear_modulus
  	remove_column :materials, :poissons_ratio
  	remove_column :materials, :yield_strength
  	remove_column :materials, :ultimate_tensile_strength
  	remove_column :materials, :ultimate_total_elongation
  	remove_column :materials, :hardness_value
  	remove_column :materials, :melting_point
  	remove_column :materials, :thermal_expansion
  	remove_column :materials, :thermal_conductivity
  	remove_column :materials, :specific_heat
  	remove_column :materials, :electrical_resistivity
  	remove_column :materials, :chemical_composition
  	remove_column :materials, :confidence_level

  	remove_column :testfiles, :uploaded_by
  	remove_column :testfiles, :mat_name
  	remove_column :testfiles, :groupname
  	remove_column :testfiles, :comments
  	remove_column :testfiles, :person_in_charge
  	remove_column :testfiles, :test_location
  	remove_column :testfiles, :test_date
  	remove_column :testfiles, :confidence_level

  	# add_column :testfiles, :file_contents, :binary
  	# add_column :testfiles, :confidence_rank, :integer
  	# add_column :users, :security_level, :integer
  end
end

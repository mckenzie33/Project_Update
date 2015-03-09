class Property < ActiveRecord::Base
  belongs_to :material 
  attr_accessible :density, :elastic_modulus, :shear_modulus, :poissons_ratio, :yield_strength,
	 :ultimate_tensile_strength, :ultimate_total_elongation, :hardness_value, :melting_point,
	 :thermal_expansion, :thermal_conductivity, :specific_heat, :electrical_resistivity,
	 :chemical_composition, :material_id
  validates :elastic_modulus, :density, :shear_modulus, :poissons_ratio, :yield_strength,
	 :ultimate_tensile_strength, :ultimate_total_elongation, :hardness_value, :melting_point,
	 :thermal_expansion, :thermal_conductivity, :specific_heat, :electrical_resistivity,
	 :chemical_composition, :allow_nil => true, :numericality => true
  validates :material, :presence => true
end

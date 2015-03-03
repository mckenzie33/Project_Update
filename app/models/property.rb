class Property < ActiveRecord::Base
  belongs_to :material 

  validates :density, :elastic_modulus, :shear_modulus, :poissons_ratio, :yield_strength,
	 :ultimate_tensile_strength, :ultimate_total_elongation, :hardness_value, :melting_point,
	 :thermal_expansion, :thermal_conductivity, :specific_heat, :electrical_resistivity,
	 :chemical_composition, :allow_nil => true,:numericality => true
  validates :material, :presence => true
end

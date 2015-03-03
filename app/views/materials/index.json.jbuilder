json.array!(@materials) do |material|
  json.extract! material, :name, :type, :density, :elastic_modulus, :shear_modulus, :poissons_ratio, :yield_strength, :ultimate_tensile_strength, :ultimate_total_elongation, :hardness_value, :melting_point, :thermal_expansion, :thermal_conductivity, :specific_heat, :electrical_resistivity, :chemical_composition, :confidence_level
  json.url material_url(material, format: :json)
end

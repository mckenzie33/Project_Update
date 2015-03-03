require 'spec_helper'

describe "materials/edit" do
  before(:each) do
    @material = assign(:material, stub_model(Material,
      :name => "MyString",
      :type => "",
      :density => 1.5,
      :elastic_modulus => 1.5,
      :shear_modulus => 1.5,
      :poissons_ratio => 1.5,
      :yield_strength => 1.5,
      :ultimate_tensile_strength => 1.5,
      :ultimate_total_elongation => 1.5,
      :hardness_value => 1.5,
      :melting_point => 1.5,
      :thermal_expansion => 1.5,
      :thermal_conductivity => 1.5,
      :specific_heat => 1.5,
      :electrical_resistivity => 1.5,
      :chemical_composition => 1.5
    ))
  end

  it "renders the edit material form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", material_path(@material), "post" do
      assert_select "input#material_name[name=?]", "material[name]"
      assert_select "input#material_type[name=?]", "material[type]"
      assert_select "input#material_density[name=?]", "material[density]"
      assert_select "input#material_elastic_modulus[name=?]", "material[elastic_modulus]"
      assert_select "input#material_shear_modulus[name=?]", "material[shear_modulus]"
      assert_select "input#material_poissons_ratio[name=?]", "material[poissons_ratio]"
      assert_select "input#material_yield_strength[name=?]", "material[yield_strength]"
      assert_select "input#material_ultimate_tensile_strength[name=?]", "material[ultimate_tensile_strength]"
      assert_select "input#material_ultimate_total_elongation[name=?]", "material[ultimate_total_elongation]"
      assert_select "input#material_hardness_value[name=?]", "material[hardness_value]"
      assert_select "input#material_melting_point[name=?]", "material[melting_point]"
      assert_select "input#material_thermal_expansion[name=?]", "material[thermal_expansion]"
      assert_select "input#material_thermal_conductivity[name=?]", "material[thermal_conductivity]"
      assert_select "input#material_specific_heat[name=?]", "material[specific_heat]"
      assert_select "input#material_electrical_resistivity[name=?]", "material[electrical_resistivity]"
      assert_select "input#material_chemical_composition[name=?]", "material[chemical_composition]"
    end
  end
end

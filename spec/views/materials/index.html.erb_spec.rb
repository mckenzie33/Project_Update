require 'spec_helper'

describe "materials/index" do
  before(:each) do
    assign(:materials, [
      stub_model(Material,
        :name => "Name",
        :type => "Type",
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
      ),
      stub_model(Material,
        :name => "Name",
        :type => "Type",
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
      )
    ])
  end

  it "renders a list of materials" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end

require 'spec_helper'

describe "dpms/edit" do
  before(:each) do
    @dpm = assign(:dpm, stub_model(Dpm))
  end

  it "renders the edit dpm form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dpm_path(@dpm), "post" do
    end
  end
end

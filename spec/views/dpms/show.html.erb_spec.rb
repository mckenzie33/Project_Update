require 'spec_helper'

describe "dpms/show" do
  before(:each) do
    @dpm = assign(:dpm, stub_model(Dpm))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end

require 'spec_helper'

describe "dpms/index" do
  before(:each) do
    assign(:dpms, [
      stub_model(Dpm),
      stub_model(Dpm)
    ])
  end

  it "renders a list of dpms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end

require 'spec_helper'

describe "dpms/new" do
  before(:each) do
    assign(:dpm, stub_model(Dpm).as_new_record)
  end

  it "renders new dpm form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dpms_path, "post" do
    end
  end
end

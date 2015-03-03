require 'spec_helper'

describe "mat_memberships/index" do
  before(:each) do
    assign(:mat_memberships, [
      stub_model(MatMembership,
        :material_id => 1,
        :group_id => 2,
        :is_confirmed => false,
        :requested_by => "Requested By",
        :comments => "Comments"
      ),
      stub_model(MatMembership,
        :material_id => 1,
        :group_id => 2,
        :is_confirmed => false,
        :requested_by => "Requested By",
        :comments => "Comments"
      )
    ])
  end

  it "renders a list of mat_memberships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Requested By".to_s, :count => 2
    assert_select "tr>td", :text => "Comments".to_s, :count => 2
  end
end

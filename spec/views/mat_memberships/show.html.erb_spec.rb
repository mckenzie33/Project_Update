require 'spec_helper'

describe "mat_memberships/show" do
  before(:each) do
    @mat_membership = assign(:mat_membership, stub_model(MatMembership,
      :material_id => 1,
      :group_id => 2,
      :is_confirmed => false,
      :requested_by => "Requested By",
      :comments => "Comments"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
    rendered.should match(/Requested By/)
    rendered.should match(/Comments/)
  end
end

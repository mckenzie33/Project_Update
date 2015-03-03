require 'spec_helper'

describe "memberships/show" do
  before(:each) do
    @membership = assign(:membership, stub_model(Membership,
      :user_id => 1,
      :group_id => 2,
      :owner => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end

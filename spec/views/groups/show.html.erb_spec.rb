require 'spec_helper'

describe "groups/show" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :groupname => "Groupname",
      :description => "Description",
      :owner_email => "Owner Email",
      :owner_id => 1,
      :is_public => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Groupname/)
    rendered.should match(/Description/)
    rendered.should match(/Owner Email/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end

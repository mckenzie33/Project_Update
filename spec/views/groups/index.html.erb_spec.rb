require 'spec_helper'

describe "groups/index" do
  before(:each) do
    assign(:groups, [
      stub_model(Group,
        :groupname => "Groupname",
        :description => "Description",
        :owner_email => "Owner Email",
        :owner_id => 1,
        :is_public => false
      ),
      stub_model(Group,
        :groupname => "Groupname",
        :description => "Description",
        :owner_email => "Owner Email",
        :owner_id => 1,
        :is_public => false
      )
    ])
  end

  it "renders a list of groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Groupname".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Owner Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

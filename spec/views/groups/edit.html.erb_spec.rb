require 'spec_helper'

describe "groups/edit" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :groupname => "MyString",
      :description => "MyString",
      :owner_email => "MyString",
      :owner_id => 1,
      :is_public => false
    ))
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", group_path(@group), "post" do
      assert_select "input#group_groupname[name=?]", "group[groupname]"
      assert_select "input#group_description[name=?]", "group[description]"
      assert_select "input#group_owner_email[name=?]", "group[owner_email]"
      assert_select "input#group_owner_id[name=?]", "group[owner_id]"
      assert_select "input#group_is_public[name=?]", "group[is_public]"
    end
  end
end

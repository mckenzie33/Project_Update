require 'spec_helper'

describe "mat_memberships/edit" do
  before(:each) do
    @mat_membership = assign(:mat_membership, stub_model(MatMembership,
      :material_id => 1,
      :group_id => 1,
      :is_confirmed => false,
      :requested_by => "MyString",
      :comments => "MyString"
    ))
  end

  it "renders the edit mat_membership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mat_membership_path(@mat_membership), "post" do
      assert_select "input#mat_membership_material_id[name=?]", "mat_membership[material_id]"
      assert_select "input#mat_membership_group_id[name=?]", "mat_membership[group_id]"
      assert_select "input#mat_membership_is_confirmed[name=?]", "mat_membership[is_confirmed]"
      assert_select "input#mat_membership_requested_by[name=?]", "mat_membership[requested_by]"
      assert_select "input#mat_membership_comments[name=?]", "mat_membership[comments]"
    end
  end
end

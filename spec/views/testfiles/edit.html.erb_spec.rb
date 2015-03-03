require 'spec_helper'

describe "testfiles/edit" do
  before(:each) do
    @testfile = assign(:testfile, stub_model(Testfile,
      :material => "MyString",
      :group => "MyString",
      :filename => "MyString",
      :uploaded_by => "MyString"
    ))
  end

  it "renders the edit testfile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", testfile_path(@testfile), "post" do
      assert_select "input#testfile_material[name=?]", "testfile[material]"
      assert_select "input#testfile_group[name=?]", "testfile[group]"
      assert_select "input#testfile_filename[name=?]", "testfile[filename]"
      assert_select "input#testfile_uploaded_by[name=?]", "testfile[uploaded_by]"
    end
  end
end

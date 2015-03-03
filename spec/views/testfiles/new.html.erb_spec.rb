require 'spec_helper'

describe "testfiles/new" do
  before(:each) do
    assign(:testfile, stub_model(Testfile,
      :material => "MyString",
      :group => "MyString",
      :filename => "MyString",
      :uploaded_by => "MyString"
    ).as_new_record)
  end

  it "renders new testfile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", testfiles_path, "post" do
      assert_select "input#testfile_material[name=?]", "testfile[material]"
      assert_select "input#testfile_group[name=?]", "testfile[group]"
      assert_select "input#testfile_filename[name=?]", "testfile[filename]"
      assert_select "input#testfile_uploaded_by[name=?]", "testfile[uploaded_by]"
    end
  end
end

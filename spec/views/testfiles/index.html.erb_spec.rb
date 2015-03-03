require 'spec_helper'

describe "testfiles/index" do
  before(:each) do
    assign(:testfiles, [
      stub_model(Testfile,
        :material => "Material",
        :group => "Group",
        :filename => "Filename",
        :uploaded_by => "Uploaded By"
      ),
      stub_model(Testfile,
        :material => "Material",
        :group => "Group",
        :filename => "Filename",
        :uploaded_by => "Uploaded By"
      )
    ])
  end

  it "renders a list of testfiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Material".to_s, :count => 2
    assert_select "tr>td", :text => "Group".to_s, :count => 2
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Uploaded By".to_s, :count => 2
  end
end

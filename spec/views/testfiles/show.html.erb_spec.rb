require 'spec_helper'

describe "testfiles/show" do
  before(:each) do
    @testfile = assign(:testfile, stub_model(Testfile,
      :material => "Material",
      :group => "Group",
      :filename => "Filename",
      :uploaded_by => "Uploaded By"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Material/)
    rendered.should match(/Group/)
    rendered.should match(/Filename/)
    rendered.should match(/Uploaded By/)
  end
end

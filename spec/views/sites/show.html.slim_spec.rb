require 'spec_helper'

describe "sites/show" do
  before(:each) do
    @site = assign(:site, stub_model(Site,
      :name => "Name",
      :site_url => "Site Url",
      :feed_url => "Feed Url",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Site Url/)
    rendered.should match(/Feed Url/)
    rendered.should match(/MyText/)
  end
end

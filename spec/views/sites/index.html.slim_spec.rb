require 'spec_helper'

describe "sites/index" do
  before(:each) do
    assign(:sites, [
      stub_model(Site,
        :name => "Name",
        :site_url => "Site Url",
        :feed_url => "Feed Url",
        :description => "MyText"
      ),
      stub_model(Site,
        :name => "Name",
        :site_url => "Site Url",
        :feed_url => "Feed Url",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Site Url".to_s, :count => 2
    assert_select "tr>td", :text => "Feed Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

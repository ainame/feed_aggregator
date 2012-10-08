require 'spec_helper'

describe "sites/edit" do
  before(:each) do
    @site = assign(:site, stub_model(Site,
      :name => "MyString",
      :site_url => "MyString",
      :feed_url => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sites_path(@site), :method => "post" do
      assert_select "input#site_name", :name => "site[name]"
      assert_select "input#site_site_url", :name => "site[site_url]"
      assert_select "input#site_feed_url", :name => "site[feed_url]"
      assert_select "textarea#site_description", :name => "site[description]"
    end
  end
end

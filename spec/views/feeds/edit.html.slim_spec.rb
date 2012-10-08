require 'spec_helper'

describe "feeds/edit" do
  before(:each) do
    @feed = assign(:feed, stub_model(Feed,
      :site_id => 1,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit feed form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feeds_path(@feed), :method => "post" do
      assert_select "input#feed_site_id", :name => "feed[site_id]"
      assert_select "input#feed_title", :name => "feed[title]"
      assert_select "textarea#feed_body", :name => "feed[body]"
    end
  end
end

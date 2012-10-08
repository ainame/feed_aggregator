require 'spec_helper'

describe "feeds/new" do
  before(:each) do
    assign(:feed, stub_model(Feed,
      :site_id => 1,
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new feed form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feeds_path, :method => "post" do
      assert_select "input#feed_site_id", :name => "feed[site_id]"
      assert_select "input#feed_title", :name => "feed[title]"
      assert_select "textarea#feed_body", :name => "feed[body]"
    end
  end
end

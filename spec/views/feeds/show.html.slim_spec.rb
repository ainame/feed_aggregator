require 'spec_helper'

describe "feeds/show" do
  before(:each) do
    @feed = assign(:feed, stub_model(Feed,
      :site_id => 1,
      :title => "Title",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end

require 'spec_helper'

describe "tag_rules/index" do
  before(:each) do
    assign(:tag_rules, [
      stub_model(TagRule,
        :name => "Name",
        :rule => "Rule"
      ),
      stub_model(TagRule,
        :name => "Name",
        :rule => "Rule"
      )
    ])
  end

  it "renders a list of tag_rules" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Rule".to_s, :count => 2
  end
end

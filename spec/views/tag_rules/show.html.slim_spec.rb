require 'spec_helper'

describe "tag_rules/show" do
  before(:each) do
    @tag_rule = assign(:tag_rule, stub_model(TagRule,
      :name => "Name",
      :rule => "Rule"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Rule/)
  end
end

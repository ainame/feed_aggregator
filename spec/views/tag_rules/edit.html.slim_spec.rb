require 'spec_helper'

describe "tag_rules/edit" do
  before(:each) do
    @tag_rule = assign(:tag_rule, stub_model(TagRule,
      :name => "MyString",
      :rule => "MyString"
    ))
  end

  it "renders the edit tag_rule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tag_rules_path(@tag_rule), :method => "post" do
      assert_select "input#tag_rule_name", :name => "tag_rule[name]"
      assert_select "input#tag_rule_rule", :name => "tag_rule[rule]"
    end
  end
end

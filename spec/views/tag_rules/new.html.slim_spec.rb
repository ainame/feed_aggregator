require 'spec_helper'

describe "tag_rules/new" do
  before(:each) do
    assign(:tag_rule, stub_model(TagRule,
      :name => "MyString",
      :rule => "MyString"
    ).as_new_record)
  end

  it "renders new tag_rule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tag_rules_path, :method => "post" do
      assert_select "input#tag_rule_name", :name => "tag_rule[name]"
      assert_select "input#tag_rule_rule", :name => "tag_rule[rule]"
    end
  end
end

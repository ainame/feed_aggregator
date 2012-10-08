require "spec_helper"

describe TagRulesController do
  describe "routing" do

    it "routes to #index" do
      get("/tag_rules").should route_to("tag_rules#index")
    end

    it "routes to #new" do
      get("/tag_rules/new").should route_to("tag_rules#new")
    end

    it "routes to #show" do
      get("/tag_rules/1").should route_to("tag_rules#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tag_rules/1/edit").should route_to("tag_rules#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tag_rules").should route_to("tag_rules#create")
    end

    it "routes to #update" do
      put("/tag_rules/1").should route_to("tag_rules#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tag_rules/1").should route_to("tag_rules#destroy", :id => "1")
    end

  end
end

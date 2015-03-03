require "spec_helper"

describe MatMembershipsController do
  describe "routing" do

    it "routes to #index" do
      get("/mat_memberships").should route_to("mat_memberships#index")
    end

    it "routes to #new" do
      get("/mat_memberships/new").should route_to("mat_memberships#new")
    end

    it "routes to #show" do
      get("/mat_memberships/1").should route_to("mat_memberships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mat_memberships/1/edit").should route_to("mat_memberships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mat_memberships").should route_to("mat_memberships#create")
    end

    it "routes to #update" do
      put("/mat_memberships/1").should route_to("mat_memberships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mat_memberships/1").should route_to("mat_memberships#destroy", :id => "1")
    end

  end
end

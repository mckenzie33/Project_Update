require "spec_helper"

describe DpmsController do
  describe "routing" do

    it "routes to #index" do
      get("/dpms").should route_to("dpms#index")
    end

    it "routes to #new" do
      get("/dpms/new").should route_to("dpms#new")
    end

    it "routes to #show" do
      get("/dpms/1").should route_to("dpms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dpms/1/edit").should route_to("dpms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dpms").should route_to("dpms#create")
    end

    it "routes to #update" do
      put("/dpms/1").should route_to("dpms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dpms/1").should route_to("dpms#destroy", :id => "1")
    end

  end
end

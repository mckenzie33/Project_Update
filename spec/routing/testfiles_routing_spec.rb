require "spec_helper"

describe TestfilesController do
  describe "routing" do

    it "routes to #index" do
      get("/testfiles").should route_to("testfiles#index")
    end

    it "routes to #new" do
      get("/testfiles/new").should route_to("testfiles#new")
    end

    it "routes to #show" do
      get("/testfiles/1").should route_to("testfiles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/testfiles/1/edit").should route_to("testfiles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/testfiles").should route_to("testfiles#create")
    end

    it "routes to #update" do
      put("/testfiles/1").should route_to("testfiles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/testfiles/1").should route_to("testfiles#destroy", :id => "1")
    end

  end
end

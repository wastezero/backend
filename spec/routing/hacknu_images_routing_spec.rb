require "rails_helper"

RSpec.describe HacknuImagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hacknu_images").to route_to("hacknu_images#index")
    end

    it "routes to #show" do
      expect(get: "/hacknu_images/1").to route_to("hacknu_images#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hacknu_images").to route_to("hacknu_images#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hacknu_images/1").to route_to("hacknu_images#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hacknu_images/1").to route_to("hacknu_images#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hacknu_images/1").to route_to("hacknu_images#destroy", id: "1")
    end
  end
end

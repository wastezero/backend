require "rails_helper"

RSpec.describe HacknuLikesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hacknu_likes").to route_to("hacknu_likes#index")
    end

    it "routes to #show" do
      expect(get: "/hacknu_likes/1").to route_to("hacknu_likes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hacknu_likes").to route_to("hacknu_likes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hacknu_likes/1").to route_to("hacknu_likes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hacknu_likes/1").to route_to("hacknu_likes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hacknu_likes/1").to route_to("hacknu_likes#destroy", id: "1")
    end
  end
end

require "rails_helper"

RSpec.describe HacknuUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hacknu_users").to route_to("hacknu_users#index")
    end

    it "routes to #show" do
      expect(get: "/hacknu_users/1").to route_to("hacknu_users#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hacknu_users").to route_to("hacknu_users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hacknu_users/1").to route_to("hacknu_users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hacknu_users/1").to route_to("hacknu_users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hacknu_users/1").to route_to("hacknu_users#destroy", id: "1")
    end
  end
end

require "rails_helper"

RSpec.describe HacknuPreferencesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hacknu_preferences").to route_to("hacknu_preferences#index")
    end

    it "routes to #show" do
      expect(get: "/hacknu_preferences/1").to route_to("hacknu_preferences#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hacknu_preferences").to route_to("hacknu_preferences#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hacknu_preferences/1").to route_to("hacknu_preferences#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hacknu_preferences/1").to route_to("hacknu_preferences#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hacknu_preferences/1").to route_to("hacknu_preferences#destroy", id: "1")
    end
  end
end

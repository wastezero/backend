require "rails_helper"

RSpec.describe HacknuTopicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hacknu_topics").to route_to("hacknu_topics#index")
    end

    it "routes to #show" do
      expect(get: "/hacknu_topics/1").to route_to("hacknu_topics#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hacknu_topics").to route_to("hacknu_topics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hacknu_topics/1").to route_to("hacknu_topics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hacknu_topics/1").to route_to("hacknu_topics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hacknu_topics/1").to route_to("hacknu_topics#destroy", id: "1")
    end
  end
end

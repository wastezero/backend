require "rails_helper"

RSpec.describe HacknuConversationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hacknu_conversations").to route_to("hacknu_conversations#index")
    end

    it "routes to #show" do
      expect(get: "/hacknu_conversations/1").to route_to("hacknu_conversations#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hacknu_conversations").to route_to("hacknu_conversations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hacknu_conversations/1").to route_to("hacknu_conversations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hacknu_conversations/1").to route_to("hacknu_conversations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hacknu_conversations/1").to route_to("hacknu_conversations#destroy", id: "1")
    end
  end
end

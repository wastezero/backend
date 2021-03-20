require "rails_helper"

RSpec.describe HacknuTopicRoomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hacknu_topic_rooms").to route_to("hacknu_topic_rooms#index")
    end

    it "routes to #show" do
      expect(get: "/hacknu_topic_rooms/1").to route_to("hacknu_topic_rooms#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hacknu_topic_rooms").to route_to("hacknu_topic_rooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hacknu_topic_rooms/1").to route_to("hacknu_topic_rooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hacknu_topic_rooms/1").to route_to("hacknu_topic_rooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hacknu_topic_rooms/1").to route_to("hacknu_topic_rooms#destroy", id: "1")
    end
  end
end

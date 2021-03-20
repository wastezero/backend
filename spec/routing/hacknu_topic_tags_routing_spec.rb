require "rails_helper"

RSpec.describe HacknuTopicTagsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hacknu_topic_tags").to route_to("hacknu_topic_tags#index")
    end

    it "routes to #show" do
      expect(get: "/hacknu_topic_tags/1").to route_to("hacknu_topic_tags#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hacknu_topic_tags").to route_to("hacknu_topic_tags#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hacknu_topic_tags/1").to route_to("hacknu_topic_tags#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hacknu_topic_tags/1").to route_to("hacknu_topic_tags#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hacknu_topic_tags/1").to route_to("hacknu_topic_tags#destroy", id: "1")
    end
  end
end

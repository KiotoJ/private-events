require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/events"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/events/new"

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    before do
      @user = User.create(email: "toto@fr.mr", password: "30030303")
    end

    it "creates new events" do
      post "/events", params: {event: {user_id: @user.id, event_place: 'Andy house', event_date: '2025/3/25'}}

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["event_place"]).to eq("Andy house")
      expect(JSON.parse(response.body)["event_date"]).to eq("2025-03-25")
    end
  end
end

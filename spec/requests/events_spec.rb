require 'rails_helper'

RSpec.describe "Events", type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(email: "toto@fr.mr", password: "30030303")
    @event = Event.create(creator: @user, attendees: [@user])
    sign_in @user
  end

  describe "GET /" do

    it "returns http success" do
      get "/events"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /events" do
    it "returns http success" do
      get "/events/new"

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /events/:id" do

    it "returns http success" do
      get "/events/#{@event.id}"

      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /events_attendees/:id" do
    before do
      @user_1 = User.create(email: "zato@fr.mr", password: "30030303")
      @event = Event.create(creator: @user, attendees: [@user])
      sign_in @user_1
    end

    it "returns http success" do
      patch "/events_attendees/#{@event.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /events" do
    it "creates new events" do
      post "/events", params: {event: {user_id: @user.id, event_place: 'Andy house', event_date: '2025/3/25'}}

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["event_place"]).to eq("Andy house")
      expect(JSON.parse(response.body)["event_date"]).to eq("2025-03-25")
    end
  end
end

require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /show" do
    before do
      @user_1 = User.create(email: 'amdin@kos.li', password: '212121212')
      @user_2 = User.create(email: 'fron@kas.de', password: '212121212')
      @event_1 = Event.create(creator: @user_1)
      @event_2 = Event.create(creator: @user_2)
    end

    it "returns http success" do
      get "/users/show/#{@user_1.id}"
      expect(response).to have_http_status(:success)
    end

    it "returns the events that the user_1 created" do
      get "/users/show/#{@user_1.id}"
      res = JSON.parse(response.body)
      expect(res.size).to be(1)
      expect(res[0]["id"]).to eq(@event_1.id)
    end

    it "returns no 404" do
      get "/users/show/#{nil}"
      expect(response).to have_http_status(:not_found)
    end

  end

end

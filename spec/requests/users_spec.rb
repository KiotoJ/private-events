require 'rails_helper'

RSpec.describe "Users", type: :request do
  include Devise::Test::IntegrationHelpers

  describe "GET /show" do
    before do
      @user_1 = User.create(email: 'amdin@kos.li', password: '212121212')
      @user_2 = User.create(email: 'fron@kas.de', password: '212121212')
      @event_1 = Event.create(creator: @user_1)
      @event_2 = Event.create(creator: @user_2)
      sign_in @user_1
    end

    it "returns http success" do
      get "/users/#{@user_1.id}"
      expect(response).to have_http_status(:success)
    end

    it "returns no 404" do
      get "/users/#{nil}"
      expect(response).to have_http_status(:not_found)
    end

  end

end

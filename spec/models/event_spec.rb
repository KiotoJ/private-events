require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = Event.build
  end

  it { expect(described_class.reflect_on_association(:creator).macro).to eq(:belongs_to) }
  it { expect(described_class.reflect_on_association(:attendees).macro).to eq(:has_many) }

  describe "Event.past" do
    before do
      user_1 = User.create(email: "fro@mi.mi", password: "reop11111")
      user_2 = User.create(email: "secon@mi.mi", password: "11111111")
      @past_event = Event.create(creator: user_1, attendees: [user_1, user_2], event_date: "2002-3-21")
      @future_event = Event.create(creator: user_1, attendees: [user_1, user_2], event_date: "2032-3-21")
    end

    it "returns past" do
      expect(Event.past).to eq([@past_event])
    end
  end

  describe "Event.future" do
    before do
      user_1 = User.create(email: "fro@mi.mi", password: "reop11111")
      user_2 = User.create(email: "secon@mi.mi", password: "11111111")
      @past_event = Event.create(creator: user_1, attendees: [user_1, user_2], event_date: "2002-3-21")
      @future_event = Event.create(creator: user_1, attendees: [user_1, user_2], event_date: "2032-3-21")
    end

    it "returns past" do
      expect(Event.future).to eq([@future_event])
    end
  end
end

require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = Event.build
  end

  it { expect(described_class.reflect_on_association(:creator).macro).to eq(:belongs_to) }
end

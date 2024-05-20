require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(described_class.reflect_on_association(:attended_events).macro).to eq(:has_many) }
end

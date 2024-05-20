class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  has_many :event_attendees, foreign_key: :event_id, inverse_of: :attended_event
  has_many :attendees, through: :event_attendees, class_name: "User", source: :attendee

  def self.past
    where('event_date <= ?', Date.today)
  end

  def self.future
    where('event_date > ?', Date.today)
  end
end

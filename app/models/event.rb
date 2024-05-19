class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  has_many :event_attendees
  has_many :attendees, through: :avent_attendees, foreign_key: :attendee_id, class_name: "User"
end

class EventAttendee < ApplicationRecord
  belongs_to :attendee, class_name: "User", foreign_key: :attendee_id, inverse_of: :event_attendees
  belongs_to :attended_event, class_name: "Event", foreign_key: :event_id, inverse_of: :event_attendees

  validates :attendee_id, uniqueness: { scope: :event_id, message: "Can only attend an event once" }
end
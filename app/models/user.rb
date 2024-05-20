class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :event_attendees, foreign_key: :attendee_id, inverse_of: :attendee
  has_many :attended_events, through: :event_attendees, class_name: "Event", source: :attended_event
end

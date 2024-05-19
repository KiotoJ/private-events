class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :event_attendees
  has_many :attended_event, through: :event_attendees, foreign_key: :event_id, class_name: "Event"
end

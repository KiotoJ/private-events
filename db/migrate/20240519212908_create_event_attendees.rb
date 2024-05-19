class CreateEventAttendees < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendees do |t|
      t.references :event
      t.references :attendee
      t.timestamps
    end
  end
end

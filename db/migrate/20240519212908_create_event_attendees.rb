class CreateEventAttendees < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendees do |t|
      t.references :event, null: false, foreign_key: true
      t.references :attendee, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end

    add_index :event_attendees, [:event_id, :attendee_id], unique: true
  end
end

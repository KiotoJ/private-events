class AddForeignKeyattendeeToEvent < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :attendee, null: false, foreign_key: {to_table: :users}, null: true
  end
end

class DropAttendees < ActiveRecord::Migration[6.1]
  def change
    drop_table :attendees
  end
end

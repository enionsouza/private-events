class DropGuests < ActiveRecord::Migration[6.1]
  def change
    drop_table :guests
  end
end

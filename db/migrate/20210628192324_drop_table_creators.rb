class DropTableCreators < ActiveRecord::Migration[6.1]
  def change
    drop_table :creators
  end
end

class RemoveColumnFromCreators < ActiveRecord::Migration[6.1]
  def change
    remove_column :creators, :event_id, :integer
  end
end

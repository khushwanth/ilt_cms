class AddCurrentCapacityToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :current_joinees, :integer, default: 0
  end
end

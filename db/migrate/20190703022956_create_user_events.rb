class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.string :uid
      t.string :eid

      t.timestamps
    end
  end
end

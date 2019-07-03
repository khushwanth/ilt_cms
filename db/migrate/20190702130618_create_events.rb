class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.string :venue

      t.timestamps
    end
  end
end

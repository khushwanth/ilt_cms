json.extract! event, :id, :title, :event_date, :start_time, :end_time, :venue, :created_at, :updated_at
json.url event_url(event, format: :json)

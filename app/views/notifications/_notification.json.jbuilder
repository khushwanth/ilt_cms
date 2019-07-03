json.extract! notification, :id, :title, :body, :image_path, :created_at, :updated_at
json.url notification_url(notification, format: :json)

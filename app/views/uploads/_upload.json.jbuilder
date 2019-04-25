json.extract! upload, :id, :title, :description, :is_public, :user_id, :created_at, :updated_at
json.url upload_url(upload, format: :json)

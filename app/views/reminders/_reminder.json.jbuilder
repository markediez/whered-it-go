json.extract! reminder, :id, :name, :url, :frequency, :archived, :status, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)

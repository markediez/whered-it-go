json.extract! reminder_template, :id, :name, :frequency, :triggered_at, :created_at, :updated_at
json.url reminder_template_url(reminder_template, format: :json)

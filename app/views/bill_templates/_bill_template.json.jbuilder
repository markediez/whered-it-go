json.extract! bill_template, :id, :name, :amount, :reminder_template_id, :url, :triggered_at, :created_at, :updated_at
json.url bill_template_url(bill_template, format: :json)

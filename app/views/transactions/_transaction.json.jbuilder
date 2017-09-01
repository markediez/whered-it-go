json.extract! transaction, :id, :name, :value, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)

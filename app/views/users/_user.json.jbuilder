json.extract! user, :id, :username, :password, :funds, :funds_set_at, :created_at, :updated_at
json.url user_url(user, format: :json)

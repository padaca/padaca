json.extract! nachricht, :id, :sender_id, :empfaenger_id, :nachricht, :created_at, :updated_at
json.url nachricht_url(nachricht, format: :json)

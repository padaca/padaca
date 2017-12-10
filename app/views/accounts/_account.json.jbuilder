json.extract! account, :id, :vorname, :nachname, :geschlecht, :istMitarbeiter, :fahrerbewertung, :mitfahrerbewertung, :standort, :created_at, :updated_at
json.url account_url(account, format: :json)

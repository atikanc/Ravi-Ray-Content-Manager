json.extract!(awarded, :id, :AwardedDate, :AwardID, :ProjectID, :created_at, :updated_at)
json.url(awarded_url(awarded, format: :json))

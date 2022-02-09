json.extract! award, :id, :AwardName, :AwardLink, :AwardYear, :created_at, :updated_at
json.url award_url(award, format: :json)

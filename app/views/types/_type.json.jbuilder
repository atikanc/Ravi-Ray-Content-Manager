json.extract! type, :id, :TypeName, :TypeIcon, :created_at, :updated_at
json.url type_url(type, format: :json)
json.TypeIcon url_for(type.TypeIcon)

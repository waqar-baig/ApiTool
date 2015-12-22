json.array!(@fields) do |field|
  json.extract! field, :id, :api_id, :name, :type, :description
  json.url field_url(field, format: :json)
end

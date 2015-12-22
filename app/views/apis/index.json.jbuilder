json.array!(@apis) do |api|
  json.extract! api, :id, :service_id, :name, :type, :path, :description, :status
  json.url api_url(api, format: :json)
end

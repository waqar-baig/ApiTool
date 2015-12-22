json.array!(@services) do |service|
  json.extract! service, :id, :project_id, :name, :description, :status
  json.url service_url(service, format: :json)
end

json.array!(@entities) do |entity|
  json.extract! entity, :id, :project_id, :name, :description, :status
  json.url entity_url(entity, format: :json)
end

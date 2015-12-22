json.array!(@projects) do |project|
  json.extract! project, :id, :name, :base_url, :user, :description
  json.url project_url(project, format: :json)
end

json.array!(@groups) do |group|
  json.extract! group, :groupname, :description, :owner_email, :owner_id, :is_public, :owner_name
  json.url group_url(group, format: :json)
end

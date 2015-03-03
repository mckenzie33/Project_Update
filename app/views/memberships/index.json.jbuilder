json.array!(@memberships) do |membership|
  json.extract! membership, :user_id, :group_id, :owner, :comments
  json.url membership_url(membership, format: :json)
end

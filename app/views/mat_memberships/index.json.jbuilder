json.array!(@mat_memberships) do |mat_membership|
  json.extract! mat_membership, :material_id, :group_id, :is_confirmed, :requested_by, :comments
  json.url mat_membership_url(mat_membership, format: :json)
end

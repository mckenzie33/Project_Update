json.array!(@dpms) do |dpm|
  json.extract! dpm, 
  json.url dpm_url(dpm, format: :json)
end

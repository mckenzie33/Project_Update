json.array!(@testfiles) do |testfile|
  json.extract! testfile, :material, :group, :filename, :uploaded_by
  json.url testfile_url(testfile, format: :json)
end

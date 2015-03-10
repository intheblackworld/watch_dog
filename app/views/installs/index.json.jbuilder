json.array!(@installs) do |install|
  json.extract! install, :id, :description, :area
  json.url install_url(install, format: :json)
end

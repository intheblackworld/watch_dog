json.array!(@specials) do |special|
  json.extract! special, :id, :title, :description, :price
  json.url special_url(special, format: :json)
end

json.array!(@classifications) do |classification|
  json.extract! classification, :id, :title
  json.url classification_url(classification, format: :json)
end

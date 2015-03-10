json.array!(@items) do |item|
  json.extract! item, :id, :model_number, :title, :standard
  json.url item_url(item, format: :json)
end

json.array!(@effects) do |effect|
  json.extract! effect, :id, :title
  json.url effect_url(effect, format: :json)
end

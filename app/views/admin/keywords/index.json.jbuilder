json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :key, :product_id
  json.url keyword_url(keyword, format: :json)
end

json.array!(@related_products) do |related_product|
  json.extract! related_product, :id, :product_id, :related_product_id
  json.url related_product_url(related_product, format: :json)
end

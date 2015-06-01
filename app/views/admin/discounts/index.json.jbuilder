json.array!(@discounts) do |discount|
  json.extract! discount, :id, :value, :since_when, :until_when, :product_id
  json.url discount_url(discount, format: :json)
end

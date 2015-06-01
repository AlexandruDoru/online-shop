json.array!(@shipping_addresses) do |shipping_address|
  json.extract! shipping_address, :id, :address_id, :user_id
  json.url shipping_address_url(shipping_address, format: :json)
end

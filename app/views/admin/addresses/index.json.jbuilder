json.array!(@addresses) do |address|
  json.extract! address, :id, :state_id, :city, :street, :zipcode
  json.url address_url(address, format: :json)
end

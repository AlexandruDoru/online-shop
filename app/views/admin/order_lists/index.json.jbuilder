json.array!(@order_lists) do |order_list|
  json.extract! order_list, :id, :order_id, :product_id
  json.url order_list_url(order_list, format: :json)
end

json.array!(@user_details) do |user_detail|
  json.extract! user_detail, :id, :firstname, :lastname, :address_id, :phone_number, :thumbnail
  json.url user_detail_url(user_detail, format: :json)
end

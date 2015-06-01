FactoryGirl.define do  factory :product_category do
    image ""
name "MyString"
description_id 1
main_category_id 1
  end
  factory :state do
    name "MyString"
abbrev "MyString"
  end
  factory :shipping_address do
    address_id 1
user_id 1
  end
  factory :address do
    state_id 1
city "MyString"
street "MyString"
zipcode 1
  end
  factory :user_detail do
    firstname "MyString"
lastname "MyString"
address_id 1
phone_number "MyString"
thumbnail ""
  end
  factory :user do
    email "MyString"
password_digest "MyString"
role "MyString"
details_id 1
  end
  factory :payment do
    order_id 1
cardnumber 1
  end
  factory :order_list do
    order_id 1
product_id 1
  end
  factory :order do
    user_id 1
value 1
shipping_address_id 1
  end
  factory :discount do
    value 1
since_when "2015-06-01"
until_when "2015-06-01"
product_id 1
  end
  factory :related_product do
    product_id 1
related_product_id 1
  end
  factory :product_attribute do
    price 1
quantity 1
product_id 1
  end
  factory :description do
    description "MyText"
  end
  factory :comment do
    comment "MyText"
user_id 1
product_id 1
  end
  factory :keyword do
    key "MyString"
product_id 1
  end
  factory :main_category do
    name "MyString"
description_id 1
  end
  factory :product do
    name "MyString"
product_category_id 1
image ""
description_id 1
  end

  

  factory :document do
    content     'Lorem Ipsum'
    association :user, factory: :user
  end
end
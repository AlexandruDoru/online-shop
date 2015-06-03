class Product < ActiveRecord::Base

  belongs_to :description
  belongs_to :product_category
  has_one :discount

  has_attached_file :image, url: "product/:id.:extension",
                path: "public/images/product/:id.:extension"
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)

  accepts_nested_attributes_for :description

  def price
  	if discount.present? && Time.zone.now.between?(discount.since_when, discount.until_when)
  		self[:price] - discount.value
  	else
  		self[:price]
  	end
  end

end

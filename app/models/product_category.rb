class ProductCategory < ActiveRecord::Base

	belongs_to :main_category
	belongs_to :description
	has_many :products

	accepts_nested_attributes_for :description

	has_attached_file :image, url: "product_category/:id.:extension",
							  path: "public/images/product_category/:id.:extension"
	validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)

end

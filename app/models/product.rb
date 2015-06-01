class Product < ActiveRecord::Base

	belongs_to :description

	has_attached_file :image, path: "private/images/product/:id.:extension"
	validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)

	accepts_nested_attributes_for :description

end

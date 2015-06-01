class MainCategory < ActiveRecord::Base

	belongs_to :description
	has_many :product_categories
	
	accepts_nested_attributes_for :description

end

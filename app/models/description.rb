class Description < ActiveRecord::Base

	has_one :main_category
	has_one :product_category
	has_one :product

end

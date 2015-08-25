class Order < ActiveRecord::Base
  has_many :order_lists

  belongs_to :user
  belongs_to :shipping_address


  def add_to_order_list(item, quantity, user)
    order_item = order_lists.find_by_product_id(item)
    if order_item.present?
      order_item.quantity = order_item.quantity + quantity.to_i
      order_item.save
    else
      order_lists << OrderList.create(product_id: item, quantity: quantity)
    end
    self.value = order_lists.map{ |x| x.product.price * x.quantity }.sum
    save
  end

  def delete_from_order_list(item)
    order_item = order_lists.find(item)
    if order_item.present?
      order_item.destroy
    end
    self.value = order_lists.map{ |x| x.product.price * x.quantity }.sum
    save
  end

end

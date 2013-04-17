class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :item_id, :quantity
  belongs_to :cart
  belongs_to :item

  def total_price
  	item.price*quantity
  end
end

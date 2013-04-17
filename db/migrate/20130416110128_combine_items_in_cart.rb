class CombineItemsInCart < ActiveRecord::Migration
  def up
  	Cart.all.each do |cart|
  		sums = cart.line_items.group(:item_id).sum(:quantity)
  		sums.each do |item_id, quantity|
  			if quantity > 1
  				cart.line_items.where(item_id: item_id).delete_all

  				cart.line_items.create(item_id: item_id, quantity: quantity)
  			end
  		end
  	end
  end

  def down
  end
end

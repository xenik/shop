class Order < ActiveRecord::Base
  attr_accessible :address, :comment, :middlename, :name, :phone, :surname, :email
  validates :name, :address, :phone, presence: true
  
  has_many :line_items, dependent: :destroy

  def add_line_items_from_cart(cart)
  	cart.line_items.each do |i|
  		i.cart_id = nil
  		line_items << i
  	end  	
  end

end

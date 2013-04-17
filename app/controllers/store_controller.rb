class StoreController < ApplicationController

	layout 'public'

  def index
  	@items = Item.order(:title)
  end
  
end

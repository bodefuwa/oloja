class ShopController < ApplicationController
  include CurrentBasket
  before_action :set_basket
  def index
  	@products = Product.order(:title)
  end
end

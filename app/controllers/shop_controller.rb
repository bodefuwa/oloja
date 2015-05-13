class ShopController < ApplicationController
  skip_before_action :authorize

  include CurrentBasket
  before_action :set_basket
  def index
  	@products = Product.order(:title)
  end
end

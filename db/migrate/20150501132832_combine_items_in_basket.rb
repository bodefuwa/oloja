class CombineItemsInBasket < ActiveRecord::Migration
  def up
    # replace multiple items for a single product in a basket with
    # a single item
    Basket.all.each do |basket|
      # count the number of each product in the basket
      sums = basket.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
      	if quantity > 1
      	  # remove individual items
      	  basket.line_items.where(product_id: product_id).delete_all

      	  # replace with a single item
      	  item = basket.line_items.build(product_id: product_id)
      	  item.quantity = quantity
      	  item.save!
         end
       end
    end
  end

  def down
    # split items with quantity>1 into multiple items
    LineItem.where("quantity>1").each do |line_item|
      # add individual items
      line_item.quantity.times do
        LineItem.create basket_id: line_item.basket_id,
          product_id: line_item.product_id, quantity: 1
      end

      # remove original item
      line_item.destroy
    end
  end
end

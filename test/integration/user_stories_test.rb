require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
 fixtures :products

 test "buying a product" do
	LineItem.delete_all
	Order.delete_all
	anakara = products(:ruby)

	get "/"
	assert_response :success
	assert_template "index"

	xml_http_request :post, '/line_items', product_id: ankara.id
	assert_response :success

	basket = Basket.find(session[:basket_id])
	assert_equal 1, basket.line_items.size
	assert_qual ankara, basket.line_items[0].product

	get "/orders/new"
	assert_response :success
	assert_template "new"

	post_via_redirect "/orders",
	 				   order: { name: 		"Alhaji Fatai",
	 				   			address: 	"124 The Street",
	 				   			email: 		"alfatail@oloja.com",
	 				   			pay_type: 	"Cash" }
	assert_response :success
	assert_template "index"
	basket = Basket.find(session[:basket_id])
	assert_equal 0, basket.line_items.size

	orders = Order.all 
	assert_equal 1, orders.size
	order = orders[0]

	assert_equal "Alhaji Fatai", 			order.name
	assert_equal "124 The Street", 		order.address
	assert_equal "alfatail@oloja.com", 	order.email
	assert_equal "Cash", 					order.pay_type

	assert_equal 1, order.line_items.size
	line_item = order.line_items[0]
	assert_equal ankara, line_items.product

	mail = ActionMailer::Base.deliveries.last 
	assert_equal ["alfatail@oloja.com"], mail.to 
	assert_equal 'Alhaji Fatai alfatail@oloja.com', mail[:from].value
	assert_equal "Oloja Shop Order Confirmation", mail.subject
  end
end

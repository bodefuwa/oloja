require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Oloja Online Shop Online Confirmation", mail.subject
    assert_equal ["awon@oloja.org"], mail.to
    assert_equal ["awa@oloja.com"], mail.from
    assert_match /1 x Ankara/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Oloja Shop Order Shipped", mail.subject
    assert_equal ["awon@oloja.org"], mail.to
    assert_equal ["awa@oloja.com"], mail.from
    assert_match /<td>1&times;<\/td>s*<td>Ankara<\/td>/, mail.body.encoded
  end

end

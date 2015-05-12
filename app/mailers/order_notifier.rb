class OrderNotifier < ApplicationMailer
  default from: 'Awon Oloja <awon@oloja.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def received(order)
    @order = order

    mail to: order.email, subject: 'Oloja Online Shop Online Confirmation'
  end

  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Oloja Shop Order Shipped'
  end 
end

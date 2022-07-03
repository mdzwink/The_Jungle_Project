class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  include HttpAuthConcern

  protect_from_forgery with: :exception

  private

  def purchase
    id = item.product_id
    @purchase = @order.line_items.map { |item| [item.product_id] }
  end
  helper_method :purchase
  # for here I need the product ids from purchase
  # This queries the Product db for products by id
  def purchase_details
    @purchase_details ||= Product.where([id: purchase.ids]).map {|product| { product: product, quantity: line_items[product.id.to_s] } }
  end
  helper_method :purchase_details

  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def enhanced_cart
    @enhanced_cart ||= Product.where(id: cart.keys).map {|product| { product:product, quantity: cart[product.id.to_s] } }
  end
  helper_method :enhanced_cart


  def cart_subtotal_cents
    enhanced_cart.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
  end
  helper_method :cart_subtotal_cents


  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end
end

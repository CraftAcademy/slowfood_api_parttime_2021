class Api::CartsController < ApplicationController

  def create
    
    
    product = Product.find(cart_params[:product_id])
    @cart = Cart.create
    @cart.cart_products.create(product_id: product.id)
    render json: { message: "#{product.name} has been added to your cart" }, status: 201
  end

  def cart_params
    params[:cart].permit(:product_id)
  end
end
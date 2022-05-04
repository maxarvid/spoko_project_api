class Api::OrdersController < ApplicationController
  def create
    order = Order.create(order_params)
    product = Product.find(params[:order][:product_id])
    order.items.create(product:)
    render json: { order: order.serialized }, status: :created
  end

  def update
    product = Product.find(params[:product_id])
    order = Order.find(params[:id])
    order.items.create(product:)
    render json: { order: order.serialized, message: "#{product.name} added" }, status: 200
  rescue StandardError
    render json: { error: 'This is product is not available. Please try another.' }, status: 404
  end

  private

  def order_params
    params[:order].permit(:user_id)
  end
end

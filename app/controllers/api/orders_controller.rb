class Api::OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[create show update]

  def create
    order = authorize Order.create(order_params)
    product = Product.find(params[:order][:product_id])
    order.items.create(product:)
    render json: { order: order.serialized }, status: :created
  end

  def update
    order = Order.find(params[:id])
    if params[:order][:activity]
      order.update_attribute(:finalised, true)
      render json: { message: 'Your order will be dispatched soon' }
    else
      product = Product.find(params[:order][:product_id])
      order.items.create(product:)
      render json: { order: order.serialized, message: "#{product.name} added" }, status: 200
    end
  rescue StandardError
    render json: { error: 'This is product is not available. Please try another.' }, status: 404
  end

  private

  def order_params
    params[:order].permit(:user_id)
  end
end

class Api::OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[create show]
  before_action :set_order_status, only: [:update]

  def create
    order = authorize Order.create(order_params)
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

  def set_order_status
    # render json: { message: 'Order status.' }, status: 200 if params [:order][:status]
  end

  def order_params
    params[:order].permit(:user_id)
  end
end

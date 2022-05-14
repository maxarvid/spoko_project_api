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
    order = Order.find(params[:id])

    if params[:activity]
      order.update_attribute(:Finalised, true)
      render json: { message: 'Your order will be dispatched soon' }
    else

      product = Product.find(params[:product_id])
      order.items.create(product:)
      render json: { order: order.serialized, message: "#{product.name} added" }, status: 200
    end
  rescue StandardError
    render json: { error: 'This is product is not available. Please try another.' }, status: 404
  end

  private

  def set_order_status
  #   if params[:activity]
  #     Order.update_attribute(:finalized, true)
  #   else
  #     Order.update_attribute(:finalized, false)
  #  end
   end

  def order_params
    params[:order].permit(:user_id)
  end
end

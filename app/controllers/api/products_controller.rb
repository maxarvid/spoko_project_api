class Api::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: { products: }
  end

  def show
    product = Product.find(params['id'])
    render json: { product: product }
  rescue StandardError
    render json: { error: 'No such item exists' }, status: 422
  end
end

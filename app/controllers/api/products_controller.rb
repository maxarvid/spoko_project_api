class Api::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: { products: }
  end

  def show
    product = Product.find(params['id'])
    response = serialize_ratings(product)
    render json: { product: response }
  rescue StandardError
    render json: { error: 'No such item exists' }, status: 422
  end

  private

  def serialize_ratings(product)
    response = product.as_json
    response[:rating] = product.rating.as_json
    response
  end
end

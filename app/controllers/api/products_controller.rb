class Api::ProductsController < ApplicationController
  
  def index
    products = Product.all 
    render json: { products: products }
  end

  def show
    product = Product.find(params['id'])
    render json: { product: product }

  end

  def create
    order = Product.all 
    render json: { product: product}, status: :created 
  end



end

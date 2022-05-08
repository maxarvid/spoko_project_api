class Api::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[create show]
  def index
    categories = Category.all.includes(:articles)
    response = serialize_categories(categories)
    render json: { articles: response }
  end

  def show
    article = Article.find(params[:id])
    render json: { article: article }
  end

  def create
    article = Article.create(params[:article].permit!)
    article.attach_image(params[:article][:image].permit!)
    render json: { article: article }, status: 201
  end

  # def create
  #   article = Article.create(article_params)
  #   article.attach_image(params[:article][:image])
  #   render json: { article: article }, status: 201
  # end
  
  private
  
  def article_params
    params[:article].permit(:title, :body,)
  end

  def serialize_categories(categories)
    response = {}
    categories.each do |category|
      response[category.name.downcase] = category.articles.as_json
    end
    response
  end

end
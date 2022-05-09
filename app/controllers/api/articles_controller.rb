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
    category = Category.find_by(name: params[:article][:category])
    new_article = Article.new(article_params)
    new_article.category = category
    new_article.save
    new_article.attach_image(params[:article][:image])
    render json: { article: new_article }, status: 201
  end

  
  private
  
  def article_params
    params[:article].permit(:title, :body)
  end

  def serialize_categories(categories)
    response = {}
    categories.each do |category|
      response[category.name.downcase] = category.articles.as_json
    end
    response
  end

end
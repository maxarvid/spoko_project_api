class Api::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[create show]
  def index
    categories = Category.all.includes(:articles)
    response = serialize_categories(categories)
    render json: { articles: response }
  end

  def show
    article = Article.find(params[:id])
    render json: { article: }
  end

  def create
    article = Article.new.create_article_with_category(article_params)
    article.attach_image(params[:article][:image])
    render json: { article: article }, status: 201
  rescue StandardError
    render json: { error: 'Invalid entry' }, status: 422
  end

  private

  def article_params
    params[:article].permit(:title, :body, :category)
  end

  def serialize_categories(categories)
    response = {}
    categories.each do |category|
      response[category.name.downcase] = category.articles.as_json
    end
    response
  end
end

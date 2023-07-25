class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update]

  def index
    # List all articles, with more recent ones at the top
    @articles = Article.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def show; end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  # def destroy
  # end
  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end

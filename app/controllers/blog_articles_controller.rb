class BlogArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]

  def index
    # List all articles, with more recent ones at the top
    @articles = BlogArticle.order(created_at: :desc)
  end

  def new
    @article = BlogArticle.new
  end

  def create
    @article = BlogArticle.new(article_params)
    @article.save
    redirect_to blog_article_path(@article)
  end

  def show; end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to blog_article_path(@article)
  end

  def destroy
    # @article.destroy will do the same job but is generally preferred if there're callback actions
    @article.delete
    redirect_to blog_articles_path, status: :see_other
  end

  private

  def find_article
    @article = BlogArticle.find(params[:id])
  end

  def article_params
    params.require(:blog_article).permit(:title, :content)
  end
end

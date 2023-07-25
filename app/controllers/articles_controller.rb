class ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end
  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end

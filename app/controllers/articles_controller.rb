class ArticlesController < ApplicationController

  before_action :set_article, only: %i[show edit update destroy]

  def index
    @search = Article.where(status: "active").ransack(params[:q])
    @articles = @search.result(distinct: true)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(articles_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update articles_params
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def articles_params
    params.require(:article).permit(:title, :body, :status, :avatar, images:[], category_ids:[])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end

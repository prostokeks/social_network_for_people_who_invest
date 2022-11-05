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
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to article_path(@article), notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other, notice: "Article was successfully destroyed."
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :avatar, images:[], category_ids:[])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end

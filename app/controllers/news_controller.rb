class NewsController < ApplicationController

  before_action :set_news, only: %i[show edit update destroy]

  def index
    @search = News.ransack(params[:q])
    @news = @search.result(distinct: true)
  end

  def show
  end

  def new
    @new = News.new
  end

  def create
    @new = current_user.news.build(news_params)
    if @new.save
      redirect_to news_index_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @new.update news_params
      redirect_to news_index_path
    else
      render :edit
    end
  end

  def destroy
    @new.destroy
    redirect_to news_index_path, status: :see_other
  end

  private

  def news_params
    params.require(:news).permit(:title, :body, :avatar, category_ids:[])
  end

  def set_news
    @new = News.find(params[:id])
  end
end

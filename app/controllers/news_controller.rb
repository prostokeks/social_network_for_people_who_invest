class NewsController < ApplicationController
  def index
    @search = News.ransack(params[:q])
    @news = @search.result(distinct: true)
  end

  def show
    @new = News.find(params[:id])
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
    @new = News.find(params[:id])
  end

  def update
    @new = News.find(params[:id])
    if @new.update news_params
      redirect_to news_index_path
    else
      render :edit
    end
  end

  def destroy
    @new = News.find(params[:id])
    @new.destroy
    redirect_to news_index_path, status: :see_other
  end

  private

  def news_params
    params.require(:news).permit(:title, :body, :avatar, category_ids:[])
  end
end

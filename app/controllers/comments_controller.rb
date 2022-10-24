class CommentsController < ApplicationController

  before_action :get_news
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @new.comments
  end

  def show
  end

  def new
    @comment = @new.comments.build
  end

  def create
    @comment = @new.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to root_path
    else
      render news_index_path
    end
  end

  def edit
  end

  def update
    if @comment.update comment_params
      redirect_to news_path(@new)
    else
      render :update
    end
  end

  def destroy
    @comment.destroy
    redirect_to news_index_path, status: :see_other
  end

  private

  def get_news
    @new = News.find(params[:news_id])
  end

  def set_comment
    @comment = @new.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :news_id)
  end
end

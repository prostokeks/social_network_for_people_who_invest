class ForumCommentsController < ApplicationController

  before_action :get_forum
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @forum.forum_comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to forum_path(@forum)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to forum_path(@forum)
    else
      render :update
    end
  end

  def destroy
    @comment.destroy
    redirect_to forums_path, status: :see_other
  end

  private

  def get_forum
    @forum = Forum.find(params[:forum_id])
  end

  def set_comment
    @comment = @forum.forum_comments.find(params[:id])
  end

  def comment_params
    params.require(:forum_comment).permit(:body, :forum_id)
  end

end

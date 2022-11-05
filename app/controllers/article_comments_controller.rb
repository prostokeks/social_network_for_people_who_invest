class ArticleCommentsController < ApplicationController

  before_action :get_article
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @article.article_comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
      render :update
    end
  end

  def destroy
    @comment.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def get_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.article_comments.find(params[:id])
  end

  def comment_params
    params.require(:article_comment).permit(:body, :article_id)
  end

end

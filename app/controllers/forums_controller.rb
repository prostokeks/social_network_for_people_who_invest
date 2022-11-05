class ForumsController < ApplicationController

  before_action :set_forum, only: %i[show edit update destroy]

  def index
    @search = Forum.where(status: "active").ransack(params[:q])
    @forums = @search.result(distinct: true)
  end

  def show
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = current_user.forums.build(forum_params)
    if @forum.save
      redirect_to forum_path(@forum), notice: "Forum was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @forum.update(forum_params)
      redirect_to forum_path(@forum), notice: "Forum was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @forum.destroy
    redirect_to forums_path, status: :see_other, notice: "Forum was successfully destroyed."
  end

  private

  def forum_params
    params.require(:forum).permit(:title, :body, :status, :avatar, category_ids:[])
  end

  def set_forum
    @forum = Forum.find(params[:id])
  end
end

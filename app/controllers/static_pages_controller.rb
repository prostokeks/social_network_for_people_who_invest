class StaticPagesController < ApplicationController

  def index
    @user = current_user
  end

  def profile
    @user = User.find(params[:id])
  end

  def about
  end

end

class Users::ShowController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).paginate(page: params[:page], per_page: 20)
  end
end

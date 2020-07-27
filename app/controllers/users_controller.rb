class UsersController < ApplicationController
  before_action :set_designated_user, only: %i[edit show update destroy following followers]
  before_action :authenticate_user!, only: %i[destroy]
  before_action -> { check_permission(@user) }, only: %i[destroy]


  def destroy
    @user.remove_avatar! if @user.icon.present?
    @user.destroy
    flash[:notice] = '削除しました。'
    redirect_to users_path
  end

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def show
    @posts = Post.where(user_id: @user.id).paginate(page: params[:page])
    @bookmarks = @user.bookmarked.paginate(page: params[:page])
  end

  def following
    @title = 'Following'
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  private

  def set_designated_user
    @user = User.find(params[:id])
  end
end

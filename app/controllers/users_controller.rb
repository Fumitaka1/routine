class UsersController < ApplicationController
  before_action :set_designated_user, only: %i[edit show update destroy]
  before_action :authenticate_user!, only: %i[destroy]
  before_action -> { check_permission(@user) }, only: %i[destroy]


  def destroy
    byebug
    current_user
    if @user.destroy
      flash[:notice] = '削除しました。'
    else
      flash[:alert] = '削除に失敗しました。'
    end
    redirect_to users_path
  end

  def index
    @users = User.all.paginate(page: params[:page], per_page: 20)
  end

  def show
    @posts = Post.where(user_id: @user.id).paginate(page: params[:page], per_page: 20)
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

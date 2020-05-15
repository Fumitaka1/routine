class PostsController < ApplicationController
  before_action :set_designated_post, only: [:edit, :show, :update, :destroy]

  def index
    @posts = Post.includes(:user).paginate(page: params[:page], per_page: 20)
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render '/posts/new'
    end
  end

  def new
    @post = Post.new
  end

  def edit

  end

  def show
    @posted_user = User.find(@post.user_id)
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to "/posts/#{@post.id}"
    else
      render "/posts/#{params[:id]}/edit"
    end

  end

  def destroy
    redirect_to posts_path if @post.destroy
  end

  private

    def post_params
      params.require(:post).permit(:title, :contents, :image)
    end

    def set_designated_post
      @post = Post.find(params[:id])
    end
end

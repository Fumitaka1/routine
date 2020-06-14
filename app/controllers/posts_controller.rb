# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_designated_post, only: %i[edit show update destroy]
  before_action :authenticate_user!, only: %i[new edit create update destroy]

  def index
    @posts = Post.includes(:user).paginate(page: params[:page], per_page: 20)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render '/posts/new'
    end
  end

  def new
    @post = Post.new
  end

  def edit; end

  def show
    @comment = Comment.new(post_id: @post.id)
    @comments = Comment.where(post_id: @post.id).paginate(page: params[:page], per_page: 20)
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to "/posts/#{@post.id}"
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to posts_path if @post.destroy!
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :remove_image)
  end

  def set_designated_post
    @post = Post.find(params[:id])
  end
end

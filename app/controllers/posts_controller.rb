class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end
  
  def create
    post = current_user.posts.new(post_params)
    if post.save
      flash[:success] = "Micropost created!"
      redirect_to post_path(post)
    else
      render '/posts/new'
    end
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def show
    @post = Post.find(params[:id])
    @posted_user = User.find(@post.user_id)
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to "/posts/#{@post.id}"
    else
      render "/posts/#{params[:id]}/edit"
    end
    
  end
  
  def destroy
    @post = Post.find(params[:id])
    redirect_to posts_path if @post.destroy
  end
  
  private
  
    def post_params
      params.require(:post).permit(:title, :contents, :image)
    end
end

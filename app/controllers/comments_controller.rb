class CommentsController < ApplicationController
  before_action :set_designated_comment, only: [:edit, :show, :update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      @post = @comment.post
      @comments = Comment.where(post_id: @post.id).paginate(page: params[:page], per_page: 20)
      render "posts/show"
    end
  end

  def new
    @comment = Comment.new
  end

  def edit
  end


  def update
    if @comment.update_attributes(comment_params)
      redirect_to "/comments/#{@comment.id}"
    else
      render 'edit'
    end

  end

  def destroy
    redirect_to comments_path if @comment.destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end

    def set_designated_comment
      @comment = Comment.find(params[:id])
    end
end

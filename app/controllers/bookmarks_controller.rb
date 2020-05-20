class BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks.paginate(page: params[:page], per_page: 20)
  end

  def create
    current_user.bookmarks.create(post_id: params[:post_id])
    redirect_to Post.find_by(params[:post_id])
  end

  def destroy
    current_user.bookmarks.find_by(params[:id]).destroy
    redirect_to Post.find_by(params[:id])
  end
end

# frozen_string_literal: true

class BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks.paginate(page: params[:page], per_page: 20)
  end

  def create
    post_id = params[:post_id]
    current_user.bookmarks.create(post_id: post_id)
    redirect_to Post.find(post_id)
  end

  def destroy
    bookmark = Bookmark.find(params[:id]).destroy
    redirect_to bookmark.post
  end
end

class Public::BookmarksController < ApplicationController

  def create
    hot_spring = HotSpring.find(params[:hot_spring_id])
    bookmark = current_user.bookmarks.new(hot_spring_id: hot_spring.id)
    bookmark.save
    redirect_to request.referer
  end

  def destroy
    hot_spring = HotSpring.find(params[:hot_spring_id])
    bookmark = current_user.bookmarks.find_by(hot_spring_id: hot_spring.id)
    bookmark.destroy
    redirect_to request.referer
  end

end

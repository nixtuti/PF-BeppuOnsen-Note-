class Public::FavoritesController < ApplicationController
  
  def create
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.new(review_id: @review.id)
    favorite.save
    #非同期通信化
    #redirect_to request.referer
    @hot_spring = HotSpring.find(params[:hot_spring_id])
  end

  def destroy
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: @review.id)
    favorite.destroy
    #非同期通信化
    #redirect_to request.referer
    @hot_spring = HotSpring.find(params[:hot_spring_id])
  end

end

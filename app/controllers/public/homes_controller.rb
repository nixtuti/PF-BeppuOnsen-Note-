class Public::HomesController < ApplicationController
  def top
    @reviews = get_latest_reviews(4)
    @qualities = Quality.all
    @tags = Tag.all
  end

  def about
  end
  
  private

  def get_latest_reviews(num)
    all = Review.where(is_pablished: true).order(created_at: :DESC)
    all.slice(0...num)
  end
end

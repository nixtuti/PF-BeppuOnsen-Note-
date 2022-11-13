class Public::HomesController < ApplicationController
  def top
    @reviews = get_latest_reviews(2)
  end

  def about
  end
  
  private

  def get_latest_reviews(num)
    all = Review.all.order(created_at: :DESC)
    all.slice(0...num)
  end
end

class Public::ReviewsController < ApplicationController
  def index
    @review = review.new
      
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to 'index', notice: "クチコミを投稿しました"
    else
      render 'index'
    end
  end
  
  def show
    
  end

  def edit
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title,:body, :rate, :user_id, :hot_spring_id, :is_pablished, images: [])
  end
  
end

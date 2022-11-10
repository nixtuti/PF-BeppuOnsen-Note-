class Public::ReviewsController < ApplicationController
  
  def index
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @review = @hot_spring.reviews.new
    @reviews = @hot_spring.reviews.page(params[:page])
  end

  def create
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @reviews = @hot_spring.reviews.page(params[:page])
    #binding.pry
    @review = @hot_spring.reviews.new(review_params)
    if @review.save
      redirect_to hot_spring_reviews_path, notice: "クチコミを投稿しました"
    else
      render 'index', alert: "クチコミの投稿に失敗しました"
    end
  end
  
  def show
    @review = Review.find_by(params[:review_id])
  end

  def edit
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to 'index', notice: "クチコミの編集に成功しました"
    else
      render 'index'
    end
  end
  
  def update
  
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title,:body, :rate, :user_id, :hot_spring_id, :is_pablished, images: [])
  end
  
end

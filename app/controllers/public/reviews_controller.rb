class Public::ReviewsController < ApplicationController
  
  def index
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @review = @hot_spring.reviews.new
    @reviews = @hot_spring.reviews.page(params[:page])
   
  end

  def create
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @reviews = @hot_spring.reviews.page(params[:page])
    @review = Review.new(review_params)
    if @review.save
      redirect_to 'index', notice: "クチコミを投稿しました"
    else
      render 'index'
    end
  end
  
  def show
    @review = Review.find(params[:id])
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

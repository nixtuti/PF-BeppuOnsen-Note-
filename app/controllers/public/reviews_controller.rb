class Public::ReviewsController < ApplicationController
  
  def index
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @review = @hot_spring.reviews.new
    @reviews = @hot_spring.reviews.page(params[:page]).order(created_at: :desc)
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
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to hot_spring_review_path(@review), notice: "クチコミの編集に成功しました"
    else
      render 'edit'
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to hot_spring_reviews_path, notice: "クチコミを削除しました"
    else
      render 'index'
    end
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title,:body, :rate, :user_id, :hot_spring_id, :is_pablished, images: [])
  end
  
end

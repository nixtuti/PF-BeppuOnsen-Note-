class Public::ReviewsController < ApplicationController

  def index
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @review = @hot_spring.reviews.new
    @reviews = @hot_spring.reviews.where(is_pablished: true).page(params[:page]).per(5).order(created_at: :desc)
  end

  def create
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @review = @hot_spring.reviews.new(review_params)
    @reviews = @hot_spring.reviews.where(is_pablished: true).page(params[:page]).per(5).order(created_at: :desc)
    @review.user_id = current_user.id
    if @review.save
      if @review.is_pablished == true
        redirect_to hot_spring_review_path(@hot_spring, @review), notice: "クチコミを投稿しました"
      else
        redirect_to hot_spring_review_path(@hot_spring, @review), notice: "クチコミを公開せず保存しました"
      end
    else
      render 'index'
    end
  end

  def show
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to hot_spring_review_path(@hot_spring, @review), notice: "クチコミの編集に成功しました"
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to hot_spring_reviews_path(@review.hot_spring), notice: "クチコミを削除しました"
    else
      render 'index'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title,:body, :rate, :user_id, :hot_spring_id, :is_pablished, images: [])
  end

end

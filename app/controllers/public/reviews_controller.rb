class Public::ReviewsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @review = @hot_spring.reviews.new
    @reviews = @hot_spring.reviews.where(is_pablished: true).page(params[:page]).per(5).order(created_at: :desc)
  end

  def create
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @review = @hot_spring.reviews.new(review_params)
    #エラー文表示(render使用)のため、再定義
    @reviews = @hot_spring.reviews.where(is_pablished: true).page(params[:page]).per(5).order(created_at: :desc)
    @review.user_id = current_user.id
    if @review.save
      if @review.is_pablished == true
        redirect_to hot_spring_review_path(@hot_spring, @review), notice: "クチコミを投稿しました。"
      else
        redirect_to hot_spring_review_path(@hot_spring, @review), notice: "クチコミを公開せず保存しました。この評価は温泉の総合評価点数に加味されません"
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
      if @review.is_pablished == true
        redirect_to hot_spring_review_path(@hot_spring, @review), notice: "クチコミの編集に成功しました。"
      else
        redirect_to hot_spring_review_path(@hot_spring, @review), notice: "クチコミを非公開にして保存しました。この評価は温泉の総合評価点数に加味されません。"
      end
    else
      render 'edit'
    end
  end
  
  def report
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @review = Review.find(params[:review_id])
    @review.update(report: true)
      # if @review.update(report: true)
      #   @review.report = true
      #   @review.update
      #   redirect_to request.referer, notice: "不適切なクチコミとして報告しました。"
      # else
      # end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to hot_spring_reviews_path(@review.hot_spring), notice: "クチコミを削除しました。"
    else
      render 'index'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title,:body, :rate, :user_id, :hot_spring_id, :is_pablished, :report, images: [])
  end
  
  def correct_user
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @review = Review.find(params[:id])
    unless @review.user == current_user
      redirect_to hot_spring_review_path(@hot_spring, @review), alert: "他人の投稿したクチコミは編集できません。"
    end
  end

end

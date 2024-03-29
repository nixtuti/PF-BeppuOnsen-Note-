class Admin::ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end
  
  def report
    @review = Review.find(params[:review_id])
    @review.update(report: false)
  end
  
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to admin_root_path, notice: "クチコミを削除しました"
    else  
      render 'show'
    end
  end
  
end

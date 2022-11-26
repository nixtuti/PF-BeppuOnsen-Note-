class Admin::CommentsController < ApplicationController
  
  def index
    @comments = Comment.page(params[:page]).per(10).order(created_at: :DESC)
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    @review = Review.find(params[:review_id])
  end
  
end

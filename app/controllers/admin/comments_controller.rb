class Admin::CommentsController < ApplicationController
  
  def destroy
    Comment.find(params[:id]).destroy
    @review = Review.find(params[:review_id])
  end
  
end

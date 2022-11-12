class Public::CommentsController < ApplicationController
  
  def create
    hot_spring = HotSpring.find(params[:hot_spring_id])
    review = Review.find(params[:review_id])
    comment = current_user.comments.new(comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to hot_spring_review_path(hot_spring,review)
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to hot_spring_review_path(params[:review_id])
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end

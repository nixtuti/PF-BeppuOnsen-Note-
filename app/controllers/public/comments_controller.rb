class Public::CommentsController < ApplicationController

  def create
    hot_spring = HotSpring.find(params[:hot_spring_id])
    review = Review.find(params[:review_id])
    #comment = Comment.new(comment_params)
    #comment.user_id = current_user.id
    #上記2行をまとめたもの
    comment = current_user.comments.new(comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to hot_spring_review_path(hot_spring, review), notice: "コメントを投稿しました"
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to request.referer, notice: "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end

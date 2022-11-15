class Public::VisitedMarksController < ApplicationController

  def create
    hot_spring = HotSpring.find(params[:hot_spring_id])
    visited_mark = current_user.visited_marks.new(hot_spring_id: hot_spring.id)
    visited_mark.save
    redirect_to request.referer
  end

  def destroy
    hot_spring = HotSpring.find(params[:hot_spring_id])
    visited_mark = current_user.visited_marks.find_by(hot_spring_id: hot_spring.id)
    visited_mark.destroy
    redirect_to request.referer
  end

end

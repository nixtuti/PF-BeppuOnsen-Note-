class Admin::HomesController < ApplicationController
  
  def top
    if params[:latest]=="true"
      @reviews = Review.page(params[:page]).order(created_at: :desc)
    elsif params[:latest_update]=="true"
      @reviews = Review.page(params[:page]).order(updated_at: :desc)
    else
      @reviews = Review.page(params[:page]).order(created_at: :desc)
    end
  end

end
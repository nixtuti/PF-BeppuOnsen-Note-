class Admin::HomesController < ApplicationController
  def top
    @reviews = Review.page(params[:page]).order(created_at: :desc)
  end
end

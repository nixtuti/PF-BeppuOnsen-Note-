class Public::HotSpringsController < ApplicationController
  
  def index
    @hot_springs = HotSpring.page(params[:page])
  end
  
  def show
    @hot_spring = HotSpring.find(params[:id])
  end
  
end

class Public::HotSpringsController < ApplicationController
  
  def index
    #@hot_springs = HotSpring.page(params[:page])
    if params[:search].present?
      hot_springs = HotSpring.looks(params[:search])
    elsif params[:quality_id].present?
      @quality = Quality.find(params[:quality_id])
      hot_spring = @quality.hot_springs.order(created_at: :desc)
    else
      hot_springs = HotSpring.all.order(created_at: :desc)
    end
    @hot_springs = Kaminari.paginate_array(hot_springs).page(params[:page]).per(10)
  end
  
  def show
    @hot_spring = HotSpring.find(params[:id])
  end
  
end

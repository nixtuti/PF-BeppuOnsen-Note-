class Public::HotSpringsController < ApplicationController

  def index
    #@hot_springs = HotSpring.page(params[:page])
    if params[:search].present?
      hot_springs = HotSpring.looks(params[:search])
    elsif params[:quality_ids].compact_blank.present?
      hot_spring_ids = HotSpringQuality.where(quality_id: params[:quality_ids].compact_blank).pluck(:hot_spring_id).uniq
      hot_springs = HotSpring.where(id: hot_spring_ids)
    #リンクの時のコード。チェックボックスに変更済
    #elsif params[:quality_id].present?
      #@quality = Quality.find(params[:quality_id])
      #hot_springs = @quality.hot_springs.order(created_at: :desc)
    else
      hot_springs = HotSpring.all.order(created_at: :desc)
    end
    @hot_springs = Kaminari.paginate_array(hot_springs).page(params[:page]).per(10)
  end

  def show
    @hot_spring = HotSpring.find(params[:id])
  end

end

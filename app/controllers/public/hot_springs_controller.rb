class Public::HotSpringsController < ApplicationController

  def index
    #サイドバーから検索があった場合と、全表示の場合の条件分岐
    if params[:search].present?
      hot_springs = HotSpring.looks(params[:search])
    elsif params[:quality_ids].present?
      hot_spring_ids = HotSpringQuality.where(quality_id: params[:quality_ids].compact_blank).pluck(:hot_spring_id).uniq
      hot_springs = HotSpring.where(id: hot_spring_ids)
    #リンクの時のコード。上の記述でチェックボックスに変更済
    #elsif params[:quality_id].present?
      #@quality = Quality.find(params[:quality_id])
      #hot_springs = @quality.hot_springs.order(created_at: :desc)
    elsif params[:tag_id].present?
      tag = Tag.find(params[:tag_id])
      hot_springs = tag.hot_springs
    else
      hot_springs = HotSpring.all
    end
  
    #並び替えの選択があった場合の条件分岐
    if params[:latest]
      hot_springs_array = hot_springs.latest
    elsif params[:oldest]
      hot_springs_array = hot_springs.oldest
    elsif params[:rate_count]
      #average_rate = hot_spring.reviews.average(:rate).to_f.round(1)
      hot_springs_array = hot_springs.rate_count
    else
      hot_springs_array = hot_springs
    end
    
    #ページネーションしたものをviewに渡す
    @hot_springs = Kaminari.paginate_array(hot_springs_array).page(params[:page]).per(10)
    
  end

  def show
    @hot_spring = HotSpring.find(params[:id])
    quality_ids = @hot_spring.qualities.pluck(:id)
    effects = QualityEffect.where(quality_id: quality_ids).pluck(:effect_id).uniq
    @effects = Effect.where(id: effects)
  end

end

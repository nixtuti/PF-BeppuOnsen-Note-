class Public::HotSpringsController < ApplicationController

  def index
    #サイドバーから検索があった場合と、全表示の場合の条件分岐
    if params[:search].present?
      @search = params[:search]
      hot_springs = HotSpring.looks(params[:search])
    elsif params[:quality_ids].present?
      @quality_ids = params[:quality_ids]
      hot_spring_ids = HotSpringQuality.where(quality_id: params[:quality_ids].compact_blank).pluck(:hot_spring_id).uniq
      hot_springs = HotSpring.where(id: hot_spring_ids)
    elsif params[:tag_id].present?
      @tag_id = params[:tag_id]
      tag = Tag.find(params[:tag_id])
      hot_springs = tag.hot_springs
    else
      hot_springs = HotSpring.all
    end

    #並び替えの選択があった場合の条件分岐
    if params[:latest]=="true"
      hot_springs_array = hot_springs.latest
    elsif params[:oldest]=="true"
      hot_springs_array = hot_springs.oldest
    elsif params[:rate_count]=="true"
      hot_springs_array = hot_springs.rate_avg
    elsif params[:review_count]=="true"
      hot_springs_array = hot_springs.review_amount
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

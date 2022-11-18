class Admin::HotSpringsController < ApplicationController
  def index
    @hot_springs = HotSpring.page(params[:page])
  end

  def show
    @hot_spring = HotSpring.find(params[:id])
    quality_ids = @hot_spring.qualities.pluck(:id)
    effects = QualityEffect.where(quality_id: quality_ids).pluck(:effect_id).uniq
    @effects = Effect.where(id: effects)
  end

  def new
    @hot_spring = HotSpring.new
    #タグの追加を行えるようにしたい
    #@tag = Tag.new(tag_params).save
  end

  def create
    @hot_spring = HotSpring.new(hot_spring_params)
    if @hot_spring.save
      redirect_to admin_hot_spring_path(@hot_spring), notice: "温泉の新規登録に成功しました"
    else
      render 'new'
    end
  end

  def edit
    @hot_spring = HotSpring.find(params[:id])
  end

  def update
    @hot_spring = HotSpring.find(params[:id])
    if @hot_spring.update(hot_spring_params)
      redirect_to admin_hot_spring_path(@hot_spring), notice: "温泉情報を編集に成功しました"
    else
      render 'edit'
    end
  end

  private

  def hot_spring_params
    params.require(:hot_spring).permit(:name, :introduction, :price, :private_bath_price, :hours, :holiday, :address, :latitude, :longitude, :parking, :contact, :running_status, :is_pablished, :hot_spring_image, quality_ids: [], tag_ids: [] )
  end

  #def tag_params
  #  params.require(:tag).permit(:name)
  #end
end

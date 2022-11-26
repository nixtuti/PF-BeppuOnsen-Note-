class Admin::UsersController < ApplicationController
  
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザー情報を編集しました"
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path, notice: "ユーザー情報を削除しました"
    else
      render 'show'
    end
  end
  
  def reviews
    @user = User.find(params[:id])
    reviews = Review.where(user_id: @user.id)
    @reviews = reviews.page(params[:page]).per(5).order(created_at: :DESC)
  end
  
  def comments
    @user = User.find(params[:id])
    comments = Comment.where(user_id: @user.id)
    @comments = comments.page(params[:page]).per(10).order(created_at: :DESC)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :sex, :birth_date, :email, :status, :profile_image)
  end
end

class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(user_params)
      redirect_to user_path(user), notice: "変更を保存しました。"
    else
      render :edit
    end
  end

  def withdrawal
    user = current_user
    customer.update(status: invalid)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :sex, :birth_date, :email, :status, :profile_image)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.username == "ゲスト"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  
    
end

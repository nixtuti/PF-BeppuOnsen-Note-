class Public::UsersController < ApplicationController
  before_action :ensure_normal_user, only: :update
  
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
  
  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは更新できません。'
    end
  end
end

class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "変更を保存しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      
      redirect_to root_path, notice: "ユーザー情報を削除しました"
    else  
      render 'show'
    end
  end
  
  def bookmarks
    @user = User.find(params[:id])
    @bookmarks = Bookmark.where(user_id: @user.id)
  end
  
  def visited_marks
    @user = User.find(params[:id])
    @visited_marks = VisitedMark.where(user_id: @user.id)
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

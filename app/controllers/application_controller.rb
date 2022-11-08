class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!, if: proc{controller_path.start_with?("admin")}
  before_action :authenticate_user!, if: proc{controller_path.start_with?("public")}, except: [:top, :about]

  protected
  
  #deviseのデータ受取カラム追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :sex, :birth_date, :status, :profile_image])
  end
  
end

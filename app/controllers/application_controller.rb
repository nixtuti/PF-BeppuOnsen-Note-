class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!, if: proc{controller_path.start_with?("admin")}
  before_action :authenticate_user!, if: proc{controller_path.start_with?("public")}, except: [:top, :about]


  # 例外処理
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  #ルーティングのエラーは捕まえられないようだった
  #rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  end

  protected

  #deviseのデータ受取カラム追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :sex, :birth_date, :status, :profile_image])
  end

end

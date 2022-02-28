class ApplicationController < ActionController::Base
  # ログインしていない場合top、about画面以外のページを表示させようとした時ログイン画面に遷移させる
  before_action :authenticate_user!, except: %i[again_top again_about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    again_user_path(resource)
  end

  def after_sign_up_path_for(resource)
    again_user_path(resource)
  end

  def after_sign_out_path_for(_resource)
    again_top_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end

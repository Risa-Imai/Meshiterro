class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  #devise利用の機能(ユーザ登録、ログイン認証など)が使われる前に実行されるメソッド
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      post_images_path
    end

    def after_sign_out_path_for(resource)
      about_path
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

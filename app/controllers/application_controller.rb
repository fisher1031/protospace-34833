class ApplicationController < ActionController::Base
  #値にメソッド名を指定することで、その戻り値がtrueであったときにのみ処理を実行
  #devise_controller?というdeviseのヘルパーメソッド名を指定して、もしdeviseに関するコントローラーの処理であれば、そのときだけconfigure_permitted_parametersメソッドを実行するように設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters   # メソッド名は慣習
    # devise_parameter_sanitizerのpermitメソッド
    #devise_parameter_sanitizer.permit(:deviseの処理名, keys: [:許可するキー])
    #:sign_up	サインアップ（新規登録）の処理を行うとき
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:occupation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:position])
  end
end

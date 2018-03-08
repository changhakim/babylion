class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    # check 메소드의 정의
    def check_authorization!
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end
end

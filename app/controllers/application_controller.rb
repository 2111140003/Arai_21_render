class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_consumer
    include SessionsHelper
    def current_consumer
        @current_consumer ||= Consumer.find(session[:consumer_id]) if session[:consumer_id]
    end
    private
   # ログイン済みユーザーかどうか確認
        def logged_in_user
            unless logged_in?
            redirect_to login_url
            end
        end
    
end

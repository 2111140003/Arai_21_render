class SessionController < ApplicationController
    def main
        if session[:login_uid] != nil
            render 'main'
        else
            render "login"
        end
    end

    def login
        if User.find_by(uid: params[:user_name]) && User.find_by(pass: params[:password])
            session[:login_uid] = params[:user_name]
            redirect_to task_index_path
        else
            render "login"
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to tops_main_path
    end
end

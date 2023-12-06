class SessionsController < ApplicationController
    def new
        @Account = Account.new
    end
    
    def create
        account = Account.find_by(email: params[:session][:email].downcase)
        if account && account.authenticate(params[:session][:password])
            log_in account
        redirect_to root_url
        else
        render 'new'
        end
    end
    
    def destroy
        log_out if logged_in?
        redirect_to root_url
    end
end

class SessionsController < ApplicationController
  def new
  end
  
  def create
    consumer = Consumer.find_by_email(params[:email])
    
    if consumer && consumer.authenticate(params[:password])
      session[:consumer_id] = consumer.id

      # チームが存在しない場合は新しいチームを作成
      if consumer.teams.empty?
        team = consumer.teams.create(team_name: "Default Team")
      else
        # チームが存在する場合は最初のチームを取得
        team = consumer.teams.first
      end

      redirect_to team_path(team), notice: "You have successfully logged in."
    else
      flash.now[:alert] = "Email or Password is invalid."
      render :new
    end
  end
  
  def destroy
    session[:consumer_id] = nil
    redirect_to root_path, notice: "You have successfully logged out."
  end
end

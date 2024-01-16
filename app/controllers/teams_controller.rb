class TeamsController < ApplicationController
  #skip_before_action :verify_authenticity_token
  
  def show
    @teams= Team.all
    @selected_team = Team.find(params[:id])
    @tasks = @selected_team.tasks
    @task = Task.new
  end
  def new
    @team = Team.new
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  def create
    @team = Team.new(team_params)
    @team.consumer = current_consumer # チームに現在のユーザーを関連付ける

    if @team.save
      redirect_to teams_path, notice: 'チームが作成されました。'
    else
      render :new
    end
  end


  private

  def team_params
    params.require(:team).permit(:team_name)
  end
end

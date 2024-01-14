class TeamsController < ApplicationController
  def show
    @teams = Team.all
    #@team = Team.find(params[:id])
    #@tasks = @team.tasks
  end
  def new
    @team = Team.new
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  def create
    @team = Team.new(team_params)
    @team.users << current_user
    if @team.save
      redirect_to teams_path, notice: 'チームが作成されました。'
    else
      render :new
    end
  end
  private

  def team_params
    params.require(:team).permit(:name)
  end
end

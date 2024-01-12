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
    team = Team.new(team_name: params[:team_name])
    team.save
    redirect_to team_show_path
  end
end

class TeamsController < ApplicationController
  #skip_before_action :verify_authenticity_token
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
    Rails.logger.debug(params.inspect)
    @team = Team.new(team_params)
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

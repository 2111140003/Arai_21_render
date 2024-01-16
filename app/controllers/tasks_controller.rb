class TasksController < ApplicationController
  def index
    @teams = current_consumer.teams
    @default_team = @teams.first
    @selected_team = params[:team_id] ? @teams.find(params[:team_id]) : @default_team
    @tasks = @selected_team.present? ? @selected_team.tasks : []
    #@tasks = Task.where(team_id: @selected_team)
    @task = Task.new

  end

  def edit
    @task = current_consumer.teams.find(params[:team_id]).tasks.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to team_path(@team), notice: 'タスクが更新されました。'
    else
      render :edit
    end
end

  def create
    @task = Task.new(task_params)
    team_id = params[:task][:team_id]
  
    # Find or create the Team based on the provided ID
    @team = current_consumer.teams.find_by(id: team_id) || current_consumer.teams.create(id: team_id)
  
    respond_to do |format|
      if @team.nil?
        format.html { redirect_to root_path, alert: 'Team not found.' }
        format.json { render json: { error: 'Team not found' }, status: :not_found }
      else
        @task.team = @team
  
        if @task.save
          format.html { redirect_to @team, notice: 'Task was successfully created.' }
          format.turbo_stream { render turbo_stream: turbo_stream.append(@team, partial: 'tasks/task', locals: { task: @task }) }
        else
          format.html { render :new }
          format.turbo_stream { render turbo_stream: turbo_stream.replace('task_errors', partial: 'shared/errors', locals: { record: @task }) }
        end
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:team_id, :task_name, :task_det)
  end
end
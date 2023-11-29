class TaskController < ApplicationController
  def index
    @tasks=Task.all
    @task=Task.new
  end

  def create
    task = Task.new(task_name: params[:task][:task_name],task_det: params[:task][:task_det])
    task.save
    redirect_to root_path
  end
  def destroy
    Task.find(params[:task_id]).destroy
    redirect_to root_path
  end
end

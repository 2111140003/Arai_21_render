class TasksController < ApplicationController
  def index
    @tasks=Task.all
    @task=Task.new
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to tasks_path
  end
  
  def create
    #task = Task.new(task_name: params[:task][:task_name],task_det: params[:task][:task_det])
    #task.save
    #redirect_to tasks_path
    task = Task.new(task_params)
    if task.save
      redirect_to tasks_path
    else
      # タスクが保存できなかった場合の処理を追加する（エラーメッセージを表示など）
      render :index
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
  
  private
  
  def task_params
    params.require(:task).permit(:task_name, :task_det)
  end
end
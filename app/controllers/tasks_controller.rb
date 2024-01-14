class TasksController < ApplicationController
  def index
    if current_user
      @team = current_user.team
      @tasks = @team.tasks
      @task = Task.new
    else
      # ログインしていない場合の処理
      redirect_to login_path, alert: 'ログインしてください。'
    end
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
  @task = Task.new(task_params)
  @task.team = current_user.team
  respond_to do |format|
    if @task.save
      # 保存成功の場合の処理
      format.turbo_stream do
        render turbo_stream: turbo_stream.append("tasks", partial: "tasks/task", locals: { task: task })
      end

    else
      Rails.logger.error("タスクの保存に失敗しました。エラーメッセージ: #{task.errors.full_messages}")
      # エラーメッセージの表示やログへの出力など
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
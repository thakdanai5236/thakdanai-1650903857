class TasksController < ApplicationController
  def index
    @tasks = Task.where(status: 'incomplete')
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.status = 'incomplete'
    if @task.save
      redirect_to tasks_path
    else
      render :index
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.update(status: 'complete')
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:status)
  end
end


class TasksController < ApplicationController
  before_action :set_task, only: %w(show edit update destroy)

  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(set_params)
    if @task.save
      redirect_to task_path(@task), notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(set_params)
      redirect_to task_path(@task), notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: t('.destroyed')
    else
      redirect_to task_path(@task), alert: t('.error') 
    end
  end

  def favourite_tasks
    @tasks = current_user.tasks.favourite_tasks
  end

  def completed_tasks
    @tasks = current_user.tasks.completed
  end

  private def set_task
    @task = current_user.tasks.find_by(id: params[:id])
    redirect_to tasks_path, alert: t('.invalid_task') unless @task
  end

  private def set_params
    params.require(:task).permit(:title, :description, :due_date, :status, :favourite)
  end
end

class TasksController < ApplicationController
  before_action :set_task, only: %w(show edit update destroy)

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(set_params)
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
    @tasks = Task.favourite_tasks
  end

  def completed_tasks
    @tasks = Task.completed
  end


  private def set_task
    @task = Task.find_by(id: params[:id])
    redirect_to tasks_path, alert: t('.invalid_task') unless @task
  end

  private def set_params
    params.require(:task).permit(:title, :description, :due_date, :status, :favourite)
  end
end

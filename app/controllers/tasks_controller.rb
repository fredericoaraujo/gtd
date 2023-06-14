class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks.order([completed: :asc, created_at: :desc])
    @colors = { low: "teal", medium: "orange", high: "red" }
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @categories = current_user.categories
    @labels = current_user.labels
    @goals = current_user.goals
    @priorities = Priority.all
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    if @task.save
      Group.create(user_id: current_user.id, task_id: @task.id)
      redirect_to task_url(@task), notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    group = Group.find_by(user_id: current_user.id, task_id: @task.id)
    group.destroy if group
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
      @categories = current_user.categories
      @labels = current_user.labels
      @goals = current_user.goals
      @priorities = Priority.all
      @colors = { low: "teal", medium: "orange", high: "red" }
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :deadline, :completed, :context, :priority_id, :status_id, :category_id, :label_id, :goal_id)
    end
end

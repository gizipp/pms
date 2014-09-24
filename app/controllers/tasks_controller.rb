class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  
  # GET /tasks
  # GET /tasks.json
  def index
    if current_user.role?("admin")
      @tasks = Task.all.order("created_at").page(params[:page]).per(5)
    else
      @tasks = current_user.tasks.page(params[:page]).per(5)
    end
    @user = User.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @work = Work.find(params[:work_id])
    @todo_list = TodoList.find(params[:todo_list_id])
    @task = Task.find(params[:id])
    @user = User.all
  end

  # GET /tasks/new
  def new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to :back, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: :back }
        #UserMailer.notif_task("gizipp.gizipp@gmail.com", @task).deliver
        #UserMailer.delay.notif_task(@task.user.email, @task)
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to :back, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: :back }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:user_id, :due_date, :name, :description, :status)
    end
end

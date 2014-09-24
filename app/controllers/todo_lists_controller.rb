class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  
  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @todo_lists = TodoList.where(work_id: params[:id]).order("created_at").page(params[:page]).per(5)
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
    @task = Task.where(todo_list_id: params[:id]).order('status DESC').order('due_date').page(params[:page]).per(5)
    @task.each do |t| 
      diff = (t.due_date - Date.today).to_i
      t.due_date = convert_due_date(diff)
     end
  end

  def convert_due_date(num)
    # raise num.to_yaml
    if num < 0
      return "jkhjkh"
    elsif num == 0
      return "jkhjkh"
    else 
      num = "ss"
    end
    # return "ddsd"
  end

  # GET /todo_lists/new
  def new
  end

  # GET /todo_lists/1/edit
  def edit
    @todo_list = TodoList.find(params[:id])
    @work = Work.find(params[:work_id])
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    @todo_list = TodoList.new(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to :back, notice: 'Todo list was successfully created.' }
        format.json { render :show, status: :created, location: :back }
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to  work_todo_list_path, notice: 'Todo list was successfully updated.' }
        format.json { render :show, status: :ok, location: work_todo_list_path }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:name, :description, :work_id)
    end
end

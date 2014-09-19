class ContributorsController < ApplicationController
  before_action :set_contributor, only: [:show, :edit, :create, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @contributors = Contributor.where(work_id: params[:work_id]).order('created_at DESC')
    @works = Work.all
  end

  def show
  end

  # GET /tasks/new
  def new
    @contributor = Contributor.new
    @work = Work.find(params[:work_id])
    @user = User.all
  end

  def create
    @contributor = Contributor.new(contributor_params)
    @work = Work.find(params[:work_id])
    @user = User.all
    respond_to do |format|
      if @contributor.save
        format.html { redirect_to :back, notice: 'Contributor was successfully created.' }
        format.json { render :show, status: :created, location: :back }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contributor.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Contributor was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contributor
    # @contributor = Contributor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contributor_params
    params.require(:contributor).permit(:user_id, :work_id)
  end
end

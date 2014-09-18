class ContributorsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    #@contributors = Contributor.all
    @contributors = Contributor.where(work_id: params[:work_id]).order('created_at DESC')
    @works = Work.all
  end

  # GET /tasks/new
  def new
    @contributor = Contributor.new
    @work = Work.find(params[:work_id])
  end

  def create
    @contributor = Contributor.new(contributor_params)

    respond_to do |format|
      if @contributor.save
        format.html { redirect_to work_contributors_path, notice: 'Contributor was successfully created.' }
        format.json { render :show, status: :created, location: work_contributors_path }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def contributor_params
    params.require(:contributor).permit(:user_id, :work_id)
  end
end

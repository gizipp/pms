class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_attachable
  load_and_authorize_resource
  
  def index
    @attachments = @attachable.attachments
  end

  def new
    @attachment = @attachable.attachments.new
  end

  def create
    @attachment = @attachable.attachments.new(attach_params)
    if @attachment.save
      flash[:notice] = "Successfully created attachment."
      redirect_to :id => nil
    else
      render :action => 'new'
    end
  end

  private
  def load_attachable
    if params[:task_id]
      @attachable = Task.find(params[:task_id])
      elsif params[:comment_id]
        @attachable = Comment.find(params[:comment_id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attach_params
    params.require(:attachment).permit(:attachment, :attachable_id, :attachable_type)
  end
end

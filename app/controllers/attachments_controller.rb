class AttachmentsController < ApplicationController
  def index
    @attachable = find_attachable
    @attachments = @attachable.attachments
  end

  def new
    @attachable = find_attachable
    @attachment = @attachable.attachments.new
  end

  def create
    @attachable = find_attachable
    @attachment = @attachable.attachments.new(attach_params)
    if @attachment.save
      flash[:notice] = "Successfully created attachment."
      redirect_to :id => nil
    else
      render :action => 'new'
    end
  end

  private
  def find_attachable
    params.each do |name, value|
      if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attach_params
    params.require(:attachment).permit(:name, :attachment, :attachable_id, :attachable_type)
  end
end

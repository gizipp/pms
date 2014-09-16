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
    @attachment = @attachable.attachments.build(params[:attachment])
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
end

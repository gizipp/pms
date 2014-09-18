class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @attachable = find_attachable
    @attachments = @attachable.attachments
  end

  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.create(comment_params)
    if @comment
      @attachable = Attachment.create(attach_params)
    end
    redirect_to task_path(@task)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:id_user, :body)
    end
    
    def attach_params
      params.require(:attachment).permit(:attachment, :attachable_id, :attachable_type)
    end
end

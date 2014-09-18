class UsersController < ApplicationController
  before_action :set_user, only: [:show ]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all.order("created_at").page(params[:page]).per(10)
  end

  def show
  end

  private
  def set_user
      @user = User.find(params[:id])
  end
end

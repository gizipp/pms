class UsersController < ApplicationController
  before_action :set_user, only: [:show ]

  def index
    @users = User.all.order("created_at").page(params[:page]).per(5)
  end

  def show
  end

  private
  def set_user
      @task = User.find(params[:id])
  end
end

class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def show
    @user = helpers.current_user
  end

  def update
  end

  def destroy
  end
end

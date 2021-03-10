class AvatarsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    flash[:success] = "You successfuly changed your profil picture"
    redirect_to(user_path(@user))
  end
end

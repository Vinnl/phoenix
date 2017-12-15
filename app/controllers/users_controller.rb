class UsersController < ApplicationController
  before_action :set_user


  def show
  end

  def edit
  end

  def destroy
    @user.destroy
    flash[:confirmation] = "Are your sure you want to delete your account?"
    flash[:notice] = "Your account has been deleted! Goodbye!"
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end

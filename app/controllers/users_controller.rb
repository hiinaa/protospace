class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.riquire(:user).permit(:nickname, :avatar, :profile, :member, :works)
  end
end

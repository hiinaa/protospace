class UsersController < ApplicationController
  before_action :acquire_user_id, only: [:edit, :show]
  before_action :authenticate_user!, only: :update

  def show
    @prototypes = @user.prototypes.order('created_at DESC')
  end

  def edit
  end

  def update
    current_user.update(update_params)
    if current_user.save
      redirect_to root_path, notice: 'Updated successfully'
    else
      render 'edit'
    end
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :avatar, :profile, :member, :works)
  end

  def acquire_user_id
    @user = User.find(params[:id])
  end
end

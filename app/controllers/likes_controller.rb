class LikesController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @prototype.likes.create(user_id: current_user.id)
    @like = @prototype.likes.find_by(user_id: current_user)
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    @prototype = Prototype.find(params[:prototype_id])
    @like = @prototype.likes.find_by(user_id: current_user)
  end
end

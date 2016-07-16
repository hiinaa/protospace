class LikesController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @prototype.likes.create(user_id: current_user.id)
    @like = @prototype.likes.find_by(user_id: current_user)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id]).destroy
    @prototype = Prototype.find(params[:prototype_id])
  end
end

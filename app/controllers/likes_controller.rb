class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @prototype = Prototype.find(params[:comment][:prototype_id])
    @comment = current_user.comments.create(comment_params)
    @comments = @prototype.comments.includes(:user)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :prototype_id).merge(user_id: current_user.id)
  end
end

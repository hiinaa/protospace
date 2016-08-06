class PrototypesController < ApplicationController
  before_action :move_to_index, except: :index
  before_action :set_prototype, except: [:index, :new, :create]

  def index
    @prototypes = Prototype.order(created_at: :DESC).page(params[:page]).per(8)
  end

  def show
    @like = @prototype.likes.find_by(user_id: current_user)
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
     @prototype.save ? ( redirect_to root_path, notice: 'Created successfully!' ) : ( redirect_to new_prototype_path, alert: 'Sorry, but something went wrong.' )
  end

  def edit
  end

  def update
    @prototype.update(prototype_params) ? ( redirect_to root_path, notice: 'Edited successfully!' ) : ( redirect_to edit_prototype_path, alert: 'Please fill in the blanks' )
  end

  def destroy
    @prototype.destroy
    redirect_to root_path, notice: 'Deleted successfully!'
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, prototype_images_attributes: [:id, :status, :image])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end

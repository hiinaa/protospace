class PrototypesController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]

  def index
    @prototypes = Prototype.order(created_at: :DESC)
  end

  def show
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
    @tag_placeholder = [:WebDesign, :UI, :Application]
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'Created successfully!
      '
    else
      render :new, alert: 'Sorry, but something went wrong.'
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, prototype_images_attributes: [:id, :status, :image])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end

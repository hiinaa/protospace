class PrototypesController < ApplicationController
  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end
end

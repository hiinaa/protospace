class PrototypesController < ApplicationController
  def new
    @prototype = Prototype.new
    @prototype.images.build
  end
end

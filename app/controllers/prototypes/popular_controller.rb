class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).order(likes_count: :DESC).limit(5)
  end
end

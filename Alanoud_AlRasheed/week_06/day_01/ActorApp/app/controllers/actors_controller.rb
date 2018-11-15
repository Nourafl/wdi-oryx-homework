class ActorsController < ApplicationController
  def index
        @actors = Actor.all
  end

  def show
        @actor = Actor.find(params[:id])
  end

  def new
        @actor = Actor.new
  end

  def create
    actor = Actor.create(actor_params)
    redirect_to actors_path(actor) 
  end

  def edit
        @actor = Actor.find(params[:id])
  end

   def update
    actor = Actor.find_by(id: params[:id])
    actor.update(actor_params)
    redirect_to actor
  end

  def destroy 
    @actor = Actor.find_by(id: params[:id])
    @actor.destroy
    redirect_to actors_path
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :location, :dob, :image)
  end
end

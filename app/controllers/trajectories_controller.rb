class TrajectoriesController < ApplicationController
  def index
    @TrajectoriesController = Trajectories.includes(:city).all
  end
end

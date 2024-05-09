class TrajectoriesController < ApplicationController
  def index
    @trajectories = trajectories.includes(:city).all
  end
end

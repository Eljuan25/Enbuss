class TrajectoriesController < ApplicationController
  def index 
    @trajectories = Trajectory.includes(:city).all
  end
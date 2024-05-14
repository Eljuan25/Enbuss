class TrajectoriesController < ApplicationController
  def index 
    Trajectory.where(city_id: params.fetch(:city_id,[]))
  end
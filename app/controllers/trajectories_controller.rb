class TrajectoriesController < ApplicationController
  def index 
    Trajectory.where(city_id: params[:city_id])
  end
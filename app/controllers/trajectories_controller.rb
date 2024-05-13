class TrajectoriesController < ApplicationController
    before_action :set_trajectory, only: %i[show update destroy]
  
    def index
      @trajectories = Trajectory.all
      render json: @trajectories.to_json(include: :schedules)
    end
  
    def show
      @trajectory = Trajectory.includes(:schedules).find(params[:id])
      render json: @trajectory.to_json(include: :schedules)
    end
  
    def create
      @trajectory = Trajectory.new(trajectory_params)
      if @trajectory.save
        render json: @trajectory, status: :created
      else
        render json: @trajectory.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @trajectory.update(trajectory_params)
        render json: @trajectory
      else
        render json: @trajectory.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @trajectory.destroy
      head :no_content
    end
  
    private
  
    def set_trajectory
      @trajectory = Trajectory.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Trajectory not found' }, status: :not_found
    end
  
    def trajectory_params
      params.require(:trajectory).permit(
        :name,
        :passing_frequency,
        :estimated_time,
        :service_cost,
        :start_time,
        :end_time,
        :trajectory_point,
        :cities_id,
        :services_id
      )
    end
  end
  
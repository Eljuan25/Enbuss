class TrajectoriesController < ApplicationController
    before_action :set_trajectory, only: %i[show create update destroy]

  
    def show
      @trajectory = Trajectory.find_with_schedules(params[:id])
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
  
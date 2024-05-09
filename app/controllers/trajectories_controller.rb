class TrajectoriesController < ApplicationController
    before_action :set_trajectory, only [show update destroy]
    
    # Get
    def index 
        @trajectories = Trajectory.all 
        render json: @trajectories
    end

    
    
    def show
        @trajectory = Trajectory.indCluides(:schedules). find(parms [:id])
        render json: @trajectory.to_json(include: :schedules)
    end

    #post /trajectories 

    def create
        @trajectory = Trajectory.new(trajectoy_params)
        if @trajectory.save
            render json: @trajectory, status: :created
        else 
            render json: @trajectory.errors status: :unprocessable_entity
        end
    end
    # Use callbacks to share common setup or constraints between actions.

    def update
        if @trajectory.update(trajectoy_params)
            render jscon: @trayectory
        else
            render json @trajectory.errors, status: :unprocessable_entity
        end
    end


    def destroy
        @trajectory.destroy
        head :no_content
    end



    private 

    def set_trajectory
        @trayectory = Trajectory.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Trayectory not found'},status: :not_found 
    end

    def trajectoy_params
        params.require(:trajectory).permit(:name, 
        :passing_frequency, 
        :estimated_time, 
        :service_cost, 
        :start_time, 
        :end_time, 
        :trajectory_point, 
        :cities_id, 
        :services_id)
    end
end


#UWU......Uwu
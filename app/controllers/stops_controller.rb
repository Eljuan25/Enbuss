class StopsController < ApplicationController
    before_action :set_stop, only: %i[show update destroy]
  
    def show
      render json: {
        id: @stop.id,
        name: @stop.name,
        other_attribute: @stop.other_attribute,
        schedules: @stop.schedules.map { |schedule| { id: schedule.id, time: schedule.time } }
      }
    end

    def create
      @stop = Stop.new(stop_params)
  
      if @stop.save
        render json: @stop, status: :created
      else
        render json: @stop.errors, status: :unprocessable_entity
      end
    end
  
    def update 
      if @stop.update(stop_params)
        render json: @stop
      else 
        render json: @stop.errors, status: :unprocessable_entity
      end
    end
  
    def destroy 
      @stop.destroy
      head :no_content
    end
  
    private
  
    def set_stop
      @stop = Stop.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Stop not found' }, status: :not_found 
    end
  
    def stop_params
      params.require(:stop).permit(
        :name,
        :trajectory_geom,
        :address
      )
    end 
end

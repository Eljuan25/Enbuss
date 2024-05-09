class StopsController < ApplicationController
    before_action : set_stop, only: %i[show update destroy]

      #Get
      def index
        @stop = Stop.all
        render json: @stops
      end

      # GET /stops/1
      def show
        render json: {
          id: @stop.id,
          name: @stop.name,
          other_attribute: @stop.other_attribute,
          schedules: @stop.schedules.map { |schedule| { id: schedule.id, time: schedule.time } }}
      end

      # POST /stops
      def create
          @stop = Stop.new(stop_params)

        if @stop.save
            redirect_to @stop, notice: 'Stop was successfully created.'
            else
                render :new
            end
        end
  

        def update 
            @stop = Stop.find(params[ :id])
            if @stop.update(stop_params)
                redirect_to @stop, notice: 'Stop was succefully updated.'
            else 
            render :edit
            end        
        end


        def destroy 
            @stop = Stop.find(params[:id])
            @stop.destroy
            redirect_to stops_url, notice: 'Stop was succefully updated.'
        end


        private

        def set_stop
            @stop = Stop.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: {error: 'Stop not found'},status: :not_found 
        end

            def stop_params
                params.require(:stop).permit(
                :name,
                :trayectory_geom,
                :address)
            end 
        end   
    end
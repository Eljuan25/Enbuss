class StopController < ApplicationController
    def index 
      if params[:city_name].present?
        @stops = Stop.where(city_id: params[:city_id])
      else
        @stops = Stop.all 
      end  
    end    
end
  
  

class StatisticsController < ApplicationController
  def show
    result = {}
    begin
      name = params[:id]
      statistics_controller = StatisticsService.new
      count = statistics_controller.get_statistics(name)
      result[:Result] = {Name: name, Count: count }
    rescue Exception => ex
        result[:Result] = {'Error Description': ex.to_s }
    end

    render json: result
  end
end

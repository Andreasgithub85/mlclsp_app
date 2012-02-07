class DemandsController < ApplicationController
  def index
     @demand = Demand.all

     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sources }
    end
    @title = "Typein"
  end

end

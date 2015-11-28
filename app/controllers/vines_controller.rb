class VinesController < ApplicationController
  def index
    @vines = Vine::API.high_velocity

    respond_to do |format|
      format.json { render json: @vines.to_json }
    end
  end
end

class VinesController < ApplicationController
  def feed
    @vines = Vine::API.high_velocity

    respond_to do |format|
      format.json { render json: @vines.to_json }
      format.rss { render layout: false }
    end
  end

  def search
    @vines = Vine::API.search(params[:search], params[:page].to_i)

    respond_to do |format|
      format.json { render json: @vines.to_json }
    end
  end
end

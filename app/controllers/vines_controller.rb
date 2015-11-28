class VinesController < ApplicationController
  def feed
    @vines = Vine::API.high_velocity

    respond_to do |format|
      format.json { render json: @vines.to_json }
      format.rss { render layout: false }
    end
  end
end

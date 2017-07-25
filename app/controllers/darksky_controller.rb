class DarkskyController < ApplicationController
  skip_before_action :authenticate_user!

  def weather
    forecast = HTTParty.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{params[:lat]},#{params[:lng]}",
      { query: {
        units: "si"
      },
      headers: { "Accept" => "application/json"}
    }).parsed_response

    render json: forecast, status: :ok
  end

end

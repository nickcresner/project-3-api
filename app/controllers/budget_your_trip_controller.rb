class BudgetYourTripController < ApplicationController

  skip_before_action :authenticate_user!

  def budget

    headers = { "X-API-KEY" => ENV['BUDGET_YOUR_TRIP_KEY'], "Accept" => "application/json" }

    country_data = HTTParty.get("http://www.budgetyourtrip.com/api/v3/search/geo/#{params[:lat]}/#{params[:lng]}", headers: headers).parsed_response

    p country_data

    country_code = country_data["data"][0]["country_code"]

    p country_code

    daily_budget = HTTParty.get("http://www.budgetyourtrip.com/api/v3/costs/country/#{country_code}",
      {
        headers: { "X-API-KEY" => ENV['BUDGET_YOUR_TRIP_KEY'], "Accept" => "application/json" }
      }).parsed_response

    p daily_budget
    render json: daily_budget["data"].last, status: :ok
  end


end

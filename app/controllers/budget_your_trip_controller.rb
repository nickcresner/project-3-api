class BudgetYourTripController < ApplicationController

  skip_before_action :authenticate_user!

  def budget
    country_data = HTTParty.get("http://www.budgetyourtrip.com/api/v3/search/geo/#{params[:lat]}/#{params[:lng]}",
      {
      headers: { "X-API-KEY": ENV['BUDGET_YOUR_TRIP_KEY'], "Accept" => "application/json"}
    }).parsed_response

    country_code = country_data["data"][0]["country_code"]
    currency_code = country_data["data"][0]["currency_code"]

    p currency_code



    daily_budget = HTTParty.get("http://www.budgetyourtrip.com/api/v3/costs/country/#{country_code}",
      {
        headers: { "X-API-KEY": ENV['BUDGET_YOUR_TRIP_KEY'], "Accept" => "application/json"}
      }).parsed_response

    daily_budget["data"].last["currency_code"] = currency_code

    render json: daily_budget["data"].last, status: :ok

    # currency_conversion =
    # HTTParty.get("http://www.budgetyourtrip.com/api/v3/currencies/convert/#{currency_code}/gbp/1"),
    # {
    #   headers: { "X-API-KEY": ENV['BUDGET_YOUR_TRIP_KEY'], "Accept" => "application/json"}
    # }).parsed_response
    #
    # render json: currency_conversion, status: :ok
    #
    # p currency_conversion
  end


end

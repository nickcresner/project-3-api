class RestCountriesController < ApplicationController
  def facts

    country = HTTParty.get("http://ws.geonames.org/countryCodeJSON?lat=#{params[:lat]}&lng=#{params[:lng]}&username=alexcwiek",
    {
      headers: { "Accept" => "application/json"}
    }).parsed_response

    p country

    country_facts = HTTParty.get("https://restcountries.eu/rest/v2/alpha/#{country["countryCode"]}",
    {
      headers: { "Accept" => "application/json"}
    }).parsed_response

    render json: country_facts, status: :ok

  end

end

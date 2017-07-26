require 'test_helper'

class RestCountriesControllerTest < ActionDispatch::IntegrationTest
  test "should get facts" do
    get rest_countries_facts_url
    assert_response :success
  end

  test "should get countries" do
    get rest_countries_countries_url
    assert_response :success
  end

end

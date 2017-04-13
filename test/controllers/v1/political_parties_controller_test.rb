require 'test_helper'

class V1::PoliticalPartiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @party = political_parties(:one)
  end

  test "should not accept bad `Accept` header" do
    get v1_political_parties_url(@party),
        headers: { "Accept": "text/html" }

    assert_response :not_acceptable
  end

  test "should find party with id" do
    get v1_political_party_url(@party),
        headers: { "Accept": "application/vnd.api+json" }

    assert_response :ok
    assert_equal "application/vnd.api+json", @response.content_type
  end
end

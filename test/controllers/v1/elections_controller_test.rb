require 'test_helper'

class V1::ElectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @election = elections(:one)
  end

  test "should find election by id" do
    get v1_election_url(@election),
        headers: {
          "Accept": "application/vnd.api+json"
        }

    assert_equal "application/vnd.api+json", @response.content_type
  end

  test "should not accept */*" do
    get v1_election_url(@election),
        headers: {
          "Accept": "*/*"
        }

    assert_response :not_acceptable
  end
end

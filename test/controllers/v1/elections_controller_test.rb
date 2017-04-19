require 'test_helper'

class V1::ElectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @election = elections(:one)
  end

  test "should find election by id" do
    get v1_election_url(@election),
        headers: { "Accept": "application/vnd.api+json"}

    assert_response :ok
    assert_equal jsonapi_media_type, @response.content_type
  end

  test "should accept `application/json` as Accept header value" do
    get v1_election_url(@election),
        headers: { "Accept": "application/json" }

    assert_response :ok
    assert_equal "application/json", @response.content_type
  end

  test "should not accept */*" do
    get v1_election_url(@election),
        headers: { "Accept": "*/*" }

    assert_response :not_acceptable
  end
end

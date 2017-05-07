require "test_helper"

class V1::ElectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @election = elections(:twenty_twelve)
  end

  test "should find election by id" do
    get v1_election_url(@election),
        headers: { "Accept": "application/vnd.api+json" }

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

  test "should not accept non-JSON API compliant JSON" do
    post v1_elections_url,
         as: :json,
         headers: {
           "Content-Type": "application/vnd.api+json",
           "Accept": "application/vnd.api+json"
         },
         params: {
           "election": {
             "year": "2017",
             "started_at": "2017-04-22T07:00:00.000Z",
             "ended_at": "2017-04-22T17:00:00.00Z"
           }
         }

    assert_response :unprocessable_entity
  end

  test "should not accept JSON without resource type" do
    post v1_elections_url,
         as: :json,
         headers: {
           "Content-Type": "application/vnd.api+json",
           "Accept": "application/vnd.api+json"
         },
         params: {
           "data": {
             "year": "2016",
             "started-at": "2016-12-07T09:00:00.000Z",
             "ended-at": "2016-12-07T17:00:00.000Z"
           }
         }

    body = JSON.parse(response.body)
    assert_response :unprocessable_entity
    assert_equal    "603", body["errors"][0]["code"]
  end

  test "should not save election with start date later than end date" do
    started_at = DateTime.now
    ended_at = started_at - 2.days

    post v1_elections_url,
              as: :json,
              headers: {
                "Content-Type": "application/vnd.api+json",
                "Accept": "application/vnd.api+json"
              },
              params: {
                "data": {
                  "attributes": {
                    "year": started_at.year,
                    "started-at": started_at.rfc3339,
                    "ended-at": ended_at.rfc3339
                  }
                },
                "type": "elections"
              }

    assert_response :bad_request
    # TODO(yawboakye): Test error response object
  end
end

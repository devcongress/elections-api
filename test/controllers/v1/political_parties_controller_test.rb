require "test_helper"

class V1::PoliticalPartiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @party = political_parties(:one)
  end

  test "should not accept catch-all `Accept` header" do
    get v1_political_parties_url(@party),
        headers: { "Accept": "*/*" }

    assert_response :not_acceptable
  end

  test "should find party with id" do
    get v1_political_party_url(@party),
        headers: { "Accept": "application/vnd.api+json" }

    assert_response :ok
    assert_equal "application/vnd.api+json", @response.content_type
  end

  test "should accept `application/json` as Accept header value" do
    get v1_political_party_url(@party),
        headers: { "Accept": "application/json" }

    assert_response :ok
    assert_equal "application/json", @response.content_type
  end

  test "should not accept non-JSON API compliant JSON" do
    post v1_political_parties_url,
         as: :json,
         headers: {
           "Content-Type": "application/vnd.api+json",
           "Accept": "application/vnd.api+json"
         },
         params: {
           "political_party": {
             "name": "Party Name",
             "slogan": "Government",
             "chairman": "Mrs. Party Chairman"
           }
         }
    assert_response :unprocessable_entity
    # TODO(yawboakye): Test error response object
  end
end

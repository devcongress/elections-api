require "test_helper"

class PoliticalPartyTest < ActiveSupport::TestCase
  setup do
    @pp = political_parties(:one)
  end
  test "should not save without name" do
    @pp.name = ""
    assert_not @pp.save
  end

  test "should not save without logo url" do
    @pp.logo_url = ""
    assert_not @pp.save
  end
end

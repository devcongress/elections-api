require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  setup do
    @prez_candidate = candidates(:presidential_candidate)
    @parli_candidate = candidates(:parliamentary_candidate)
  end

  test "should save presidential candidate who is older than 40" do
    assert_not @election.save
  end

  test "should not save presidential candidate who is not 40 or older" do
  end

  test "should not save parlimentary  candidate older than 18" do
  end

  test "if not presidential candidate,  should be belong to constituency" do
    #TODO(bubunyo) pull constituency model from petersowah and do test
  end

end

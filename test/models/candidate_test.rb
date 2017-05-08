require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  setup do
    @prez_candidate = candidates(:presidential_candidate)
    @parli_candidate = candidates(:parliamentary_candidate)
    @election = elections(:twenty_twelve)
    @prez_candidate.election = @election
    @parli_candidate.election = @election
  end

  test "should not save candidate who is younger than 18 during election" do
    @parli_candidate.date_of_birth =
      @parli_candidate.date_of_birth.change(year: (@election.year - 17))
    assert_not @parli_candidate.save
  end

  test "should not save presidential candidate who is not 40 or older" do
    @prez_candidate.date_of_birth =
      @prez_candidate.date_of_birth.change(year: (@election.year - 39))
    assert_not @prez_candidate.save
  end

  test "should save parlimentary  candidate older than 18" do
    @parli_candidate.date_of_birth =
      @parli_candidate.date_of_birth.change(year: (@election.year - 19))
    assert @parli_candidate.save
  end

  test "should save presidential candidate older than 40" do
    @prez_candidate.date_of_birth =
      @prez_candidate.date_of_birth.change(year: (@election.year - 49))
    assert @prez_candidate.save
  end

  test "if not presidential candidate,  should be belong to constituency" do
    # TODO(bubunyo) pull constituency model from petersowah and do test
  end
end

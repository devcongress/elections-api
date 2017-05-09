require "test_helper"

class ElectionTest < ActiveSupport::TestCase
  setup do
    @election = elections(:twenty_twelve)
  end

  test "should not save with negative year" do
    @election.year = -1992
    assert_not @election.save
  end

  test "should not save with duplicate year" do
    dup = Election.new(year: @election.year, started_at: DateTime.now,
                       ended_at: DateTime.now)
    assert_not dup.save
  end
end

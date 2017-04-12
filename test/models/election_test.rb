require 'test_helper'

class ElectionTest < ActiveSupport::TestCase
  setup do
    @election = elections(:one)
  end

  test "should not save without year" do
    @election.year = nil
    assert_not @election.save
  end

  test "should not save without started at" do
    @election.started_at = nil
    assert_not @election.save
  end

  test "should not save without ended at" do
    @election.ended_at = nil
    assert_not @election.save
  end

  test "should not save with negative year" do
    @election.year = -1992
    assert_not @election.save
  end

  test "should not save with duplicate year" do
    dup = Election.new(year: @election.year, started_at: DateTime.now, ended_at: DateTime.now)
    assert_not dup.save
  end

  # TODO(yawboakye):
  # (1) Test that `started_at` is same as election year
  # (2) Test that `ended_at` comes after `started_at`
end

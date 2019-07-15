require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  test "before_validation auto assigns a puzzle" do
    round = Round.new

    assert round.save
    assert round.puzzle.present?
  end
end

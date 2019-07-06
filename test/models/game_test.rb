require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "before_validation auto assigns a puzzle" do
    game = Game.new

    assert game.save
    assert game.puzzle.present?
  end
end

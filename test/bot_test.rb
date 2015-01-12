require 'test_helper'

class BotTest < Minitest::Test
  def setup
    @brick = mock
    @bot = Robolove::Bot.new(@brick)
  end

  def test_bot_creates_a_brick
    brick = 'fake brick'
    ::LegoNXT::LowLevel.stub(:connect, brick) {}
    bot = Robolove::Bot.new(brick)
    assert_equal brick, bot.brick
  end

  def test_forward_runs_motor_a
    @brick.expect(:run_motor, true, [:a])
    @bot.forward
    @brick.verify
  end
end

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

  def test_forward_runs_both_motors
    def @brick.stop_motor(port); true; end
    @brick.expect(:run_motor, true, [:a])
    @brick.expect(:run_motor, true, [:b])
    @bot.forward
    @brick.verify
  end

  def test_forward_stops_motors_after_duration
    def @brick.run_motor(port); true; end
    @brick.expect(:stop_motor, true, [:a])
    @brick.expect(:stop_motor, true, [:b])

    @bot.forward(0)
    @brick.verify
  end

  def test_right_runs_motor_a
    def @brick.stop_motor(port); true; end
    @brick.expect(:run_motor, true, [:a])

    @bot.right
    @brick.verify
  end

  def test_right_stops_motor_a_after_duration
    def @brick.run_motor(port); true; end
    @brick.expect(:stop_motor, true, [:a])

    @bot.right(0)
    @brick.verify
  end
end

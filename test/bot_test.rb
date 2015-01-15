require 'test_helper'

class BotTest < Minitest::Test
  def setup
    @brick = mock
    @left = 'test_left'
    @right = 'test_right'
    @bot = Robolove::Bot.new(brick: @brick, left_motor: @left, right_motor: @right)
  end

  def test_bot_creates_a_brick
    brick = 'fake brick'
    ::LegoNXT::LowLevel.stub(:connect, brick) {}
    bot = Robolove::Bot.new(brick: brick)
    assert_equal brick, bot.brick
  end

  def test_forward_runs_both_motors
    def @brick.stop_motor(port); true; end
    @brick.expect(:run_motor, true, [@left])
    @brick.expect(:run_motor, true, [@right])
    @bot.forward
    @brick.verify
  end

  def test_forward_stops_motors_after_duration
    def @brick.run_motor(port); true; end
    @brick.expect(:stop_motor, true, [@left])
    @brick.expect(:stop_motor, true, [@right])

    @bot.forward(0)
    @brick.verify
  end

  def test_right_runs_motor
    def @brick.stop_motor(port); true; end
    @brick.expect(:run_motor, true, [@left])

    @bot.right
    @brick.verify
  end

  def test_right_stops_motor_after_duration
    def @brick.run_motor(port); true; end
    @brick.expect(:stop_motor, true, [@left])

    @bot.right(0)
    @brick.verify
  end

  def test_left_runs_motor
    def @brick.stop_motor(port); true; end
    @brick.expect(:run_motor, true, [@right])

    @bot.left
    @brick.verify
  end

  def test_right_stops_motor_after_duration
    def @brick.run_motor(port); true; end
    @brick.expect(:stop_motor, true, [@right])

    @bot.left(0)
    @brick.verify
  end
end

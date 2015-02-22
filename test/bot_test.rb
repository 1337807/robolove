require 'test_helper'

class BotTest < Minitest::Test
  def setup
    @brick = mock
    @left = 'test_left'
    @right = 'test_right'
    @speed = 100
    @bot = Robolove::Bot.new(
      brick: @brick,
      left_motor: @left,
      right_motor: @right,
      speed: @speed
    )
  end

  def test_bot_creates_a_brick
    brick = 'fake brick'
    ::LegoNXT::LowLevel.stub(:connect, brick) {}
    bot = Robolove::Bot.new(brick: brick)
    assert_equal brick, bot.brick
  end

  def test_forward_runs_both_motors
    @brick.stubs(:stop_motor)
    @brick.expects(:run_motor).with(@left, @speed)
    @brick.expects(:run_motor).with(@right, @speed)

    @bot.forward(0)
  end

  def test_forward_stops_motors_after_duration
    @brick.stubs(:run_motor)
    @brick.expects(:stop_motor).with(@left)
    @brick.expects(:stop_motor).with(@right)

    @bot.forward(0)
  end

  def test_right_runs_motors
    @brick.stubs(:stop_motor)
    @brick.expects(:run_motor).with(@left, @speed)
    @brick.expects(:run_motor).with(@right, -@speed)

    @bot.right(0)
  end

  def test_right_stops_motors_after_duration
    @brick.stubs(:run_motor)
    @brick.expects(:stop_motor).with(@left)
    @brick.expects(:stop_motor).with(@right)

    @bot.right(0)
  end

  def test_left_runs_motors
    @brick.stubs(:stop_motor)
    @brick.expects(:run_motor).with(@right, @speed)
    @brick.expects(:run_motor).with(@left, -@speed)

    @bot.left(0)
  end

  def test_left_stops_motors_after_duration
    @brick.stubs(:run_motor)
    @brick.expects(:stop_motor).with(@right)
    @brick.expects(:stop_motor).with(@left)

    @bot.left(0)
  end

  def test_backward_runs_both_motors
    def @brick.stop_motor(port); true; end
    @brick.stubs(:stop_motor)
    @brick.expects(:run_motor).with(@left, -@speed)
    @brick.expects(:run_motor).with(@right, -@speed)

    @bot.backward(0)
  end

  def test_backward_stops_motors_after_duration
    @brick.stubs(:run_motor)
    @brick.expects(:stop_motor).with(@left)
    @brick.expects(:stop_motor).with(@right)

    @bot.backward(0)
  end
end

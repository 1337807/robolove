require 'lego_nxt'

module Robolove
  class Bot
    DEFAULTS = {
      :brick => nil,
      :left_motor => :a,
      :right_motor => :b,
      :speed => 100
    }
    attr_reader :brick, :left_motor, :right_motor, :speed

    def initialize(options = {})
      options = DEFAULTS.merge options

      @brick = options[:brick] || LegoNXT::LowLevel.connect
      @left_motor = options[:left_motor] || DEFAULTS[:left_motor]
      @right_motor = options[:right_motor] || DEFAULTS[:right_motor]
      @speed = options[:speed] || DEFAULTS[:speed]
    end

    def forward(duration = 1)
      self.brick.run_motor(self.left_motor, self.speed)
      self.brick.run_motor(self.right_motor, self.speed)
      sleep duration
      self.brick.stop_motor(self.left_motor)
      self.brick.stop_motor(self.right_motor)
    end

    def backward(duration = 1)
      self.brick.run_motor(self.left_motor, -self.speed)
      self.brick.run_motor(self.right_motor, -self.speed)
      sleep duration
      self.brick.stop_motor(self.left_motor)
      self.brick.stop_motor(self.right_motor)
    end

    def right(duration = 0.5)
      self.brick.run_motor(self.left_motor, self.speed)
      self.brick.run_motor(self.right_motor, -self.speed)
      sleep duration
      self.brick.stop_motor(self.left_motor)
      self.brick.stop_motor(self.right_motor)
    end

    def left(duration = 0.5)
      self.brick.run_motor(self.right_motor, self.speed)
      self.brick.run_motor(self.left_motor, -self.speed)
      sleep duration
      self.brick.stop_motor(self.right_motor)
      self.brick.stop_motor(self.left_motor)
    end

    def stop
      self.brick.stop_motor(self.right_motor)
      self.brick.stop_motor(self.left_motor)
    end
  end
end

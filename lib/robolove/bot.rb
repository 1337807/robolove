require 'lego_nxt'

module Robolove
  class Bot
    attr_reader :brick

    def initialize(brick = nil)
      @brick = brick || LegoNXT::LowLevel.connect
    end

    def forward(duration = 1)
      self.brick.run_motor(:a)
      self.brick.run_motor(:b)
      sleep duration
      self.brick.stop_motor(:a)
      self.brick.stop_motor(:b)
    end

    def right(duration = 0.5)
      self.brick.run_motor(:a)
      sleep duration
      self.brick.stop_motor(:a)
    end
  end
end

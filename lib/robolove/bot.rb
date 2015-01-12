require 'lego_nxt'

module Robolove
  class Bot
    attr_reader :brick

    def initialize(brick = nil)
      @brick = brick || LegoNXT::LowLevel.connect
    end

    def forward
      self.brick.run_motor(:a)
    end
  end
end

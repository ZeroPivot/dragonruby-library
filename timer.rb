# rubocop:disable Style/IfUnlessModifier
# rubocop:disable Style/ParenthesesAroundCondition
# rubocop:disable Style/FrozenStringLiteralComment

# Create a timer-based system based on
# args.state.tick_count
# 60ticks/frames = 1 second
class Timer
  def initialize(args:)
    @args = args   
    @creation_timestamp = @args.state.tick_count
    @react_at = -1
    @reacted = false
    @triggered = false
  end

  def react_at(react_time:)
    @react_at = react_time
    @reacted = false
    @triggered = false
  end

  def check_trigger
    if (!@reacted && (@args.state.tick_count >= @react_at))
      @triggered = true
      @react_at = -1
    end
    @triggered
  end

  # if Clock#tick == true then timer has been reached; called every frame
  def tick_and_check 
    check_trigger # this is called every frame
  end
end

# rubocop:enable Style/FrozenStringLiteralComment
# rubocop:enable Style/ParenthesesAroundCondition
# rubocop:enable Style/IfUnlessModifier

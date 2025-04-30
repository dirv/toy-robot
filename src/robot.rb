class Robot
  attr_accessor :x
  attr_accessor :y
  attr_accessor :facing

  def self.at(x, y, facing)
    robot = self.new
    robot.x = x
    robot.y = y
    robot.facing = facing
    robot
  end

  def perform_action(command, params = {})
    if command == :place
      self.class.at(params[:x], params[:y], params[:facing])
    elsif command == :move
      move_if_safe(move)
    else
      self
    end
  end

  private

  MAX_X = 4
  MAX_Y = 4

  def move
    case facing
    when :north
      self.class.at(self.x, self.y + 1, self.facing)
    when :south
      self.class.at(self.x, self.y - 1, self.facing)
    when :east
      self.class.at(self.x + 1, self.y, self.facing)
    when :west
      self.class.at(self.x - 1, self.y, self.facing)
    end
  end

  def move_if_safe(new_state)
    if new_state.y > MAX_Y
      self
    elsif new_state.y < 0
      self
    elsif new_state.x > MAX_X
      self
    elsif new_state.x < 0
      self
    else
      new_state
    end
  end

end

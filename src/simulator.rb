require "./src/parser"
require "./src/robot"

class Simulator

  attr_accessor :current_robot

  def initialize
    self.current_robot = Robot.new
  end

  def perform_action(string)
    command, params = Parser.parse(string.strip)
    if command == :report
      build_report
    else
      self.current_robot = current_robot.perform_action(command, params)
      nil
    end
  end

  def perform_with_io
    loop do
      Kernel.putc(">")
      Kernel.putc(" ")
      line = Kernel.gets
      result = perform_action(line)
      if result
        Kernel.puts(result)
      end
    end
  end

  private

  def build_report
    return unless current_robot.placed?
    "#{current_robot.x},#{current_robot.y},#{current_robot.facing.to_s.upcase}"
  end
end

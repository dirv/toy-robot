require "./src/tabletop"

class Parser
  def self.parse(command)
    if command == "LEFT"
      [ :left ]
    elsif command == "RIGHT"
      [ :right ]
    elsif command == "MOVE"
      [ :move ]
    elsif command == "REPORT"
      [ :report ]
    elsif command.start_with?("PLACE")
      ensure_valid_place_command(build_place_command(command))
    else
      nil
    end
  end

  private

  VALID_FACING_DIRECTIONS = [ :north, :south, :east, :west ]

  def self.ensure_valid_place_command(command)
    return unless command

    _, params = command
    return unless VALID_FACING_DIRECTIONS.include?(params[:facing])
    return unless params[:y].between?(0, Tabletop::MAX_Y)
    return unless params[:x].between?(0, Tabletop::MAX_X)

    command
  end

  def self.build_place_command(command)
    x, y, facing = command.split(/^PLACE /)[1]&.split(",")

    return unless x&.match(/^\d+$/)
    return unless y&.match(/^\d+$/)
    return unless facing

    [ :place, { x: x.to_i, y: y.to_i, facing: facing.downcase.to_sym } ]
  end
end

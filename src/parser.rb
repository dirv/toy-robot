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
      _, x, y, facing = command.split(" ");
      [ :place, { x: x.to_i, y: y.to_i, facing: facing.downcase.to_sym } ]
    else
      nil
    end
  end
end

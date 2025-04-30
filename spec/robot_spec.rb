require "./src/robot"

describe "Robot" do
  def robot_at(position)
    Robot.new.perform_action(:place, position)
  end

  it "initially has no position" do
    expect(Robot.new.x).to be_nil
    expect(Robot.new.y).to be_nil
  end

  it "initially has no direction" do
    expect(Robot.new.facing).to be_nil
  end

  describe "#perform_action" do
    it "returns the same robot if the command is not recognised" do
      robot = Robot.new
      expect(robot.perform_action(:unknown)).to eq robot
    end

    it "places the robot" do
      robot = Robot.new.perform_action(:place, { x: 1, y: 2, facing: :north })
      expect(robot.x).to eq 1
      expect(robot.y).to eq 2
      expect(robot.facing).to eq :north
    end

    it "moves north" do
      robot = robot_at({ x: 1, y: 2, facing: :north })
      expect(robot.perform_action(:move).y).to eq 3
    end

    it "moves south" do
      robot = robot_at({ x: 1, y: 2, facing: :south })
      expect(robot.perform_action(:move).y).to eq 1
    end

    it "moves east" do
      robot = robot_at({ x: 1, y: 2, facing: :east })
      expect(robot.perform_action(:move).x).to eq 2
    end

    it "moves west" do
      robot = robot_at({ x: 1, y: 2, facing: :west })
      expect(robot.perform_action(:move).x).to eq 0
    end

    it "does not move north if the toy is at the north boundary" do
      robot = robot_at({ x: 1, y: 4, facing: :north })
      expect(robot.perform_action(:move).y).to eq 4
    end

    it "does not move south if the toy is at the south boundary" do
      robot = robot_at({ x: 1, y: 0, facing: :south })
      expect(robot.perform_action(:move).y).to eq 0
    end

    it "does not move east if the toy is at the east boundary" do
      robot = robot_at({ x: 4, y: 2, facing: :east })
      expect(robot.perform_action(:move).x).to eq 4
    end

    it "does not move west if the toy is at the west boundary" do
      robot = robot_at({ x: 0, y: 2, facing: :west })
      expect(robot.perform_action(:move).x).to eq 0
    end

    LEFT_TURNS = {
      north: :west,
      west: :south,
      south: :east,
      east: :north
    }

    LEFT_TURNS.each do |(start, finish)|
      it "turns left to face #{finish} when currently #{start}" do
        robot = robot_at({ x: 0, y: 2, facing: start })
        expect(robot.perform_action(:left).facing).to eq finish
      end
    end

    RIGHT_TURNS = {
      north: :east,
      west: :north,
      south: :west,
      east: :south
    }

    RIGHT_TURNS.each do |(start, finish)|
      it "turns right to face #{finish} when currently #{start}" do
        robot = robot_at({ x: 0, y: 2, facing: start })
        expect(robot.perform_action(:right).facing).to eq finish
      end
    end

    it "does not move if the robot has not yet been placed" do
      robot = Robot.new
      expect(robot.perform_action(:move)).to eq robot
    end

    it "does not turn left if the robot has not yet been placed" do
      robot = Robot.new
      expect(robot.perform_action(:left)).to eq robot
    end

    it "does not turn right if the robot has not yet been placed" do
      robot = Robot.new
      expect(robot.perform_action(:right)).to eq robot
    end
  end

  describe "#placed?" do
    it "is initially false" do
      expect(Robot.new).not_to be_placed
    end

    it "is true after placing robot" do
      robot = robot_at({ x: 0, y: 2, facing: :north })
      expect(robot).to be_placed
    end
  end
end


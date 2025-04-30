require "./src/simulator.rb"

describe Simulator do
  describe "#perform_action" do
    it "places and moves" do
      simulator = Simulator.new
      simulator.perform_action("PLACE 0,0,NORTH\n")
      simulator.perform_action("MOVE\n")
      result = simulator.perform_action("REPORT\n")
      expect(result).to eq "0,1,NORTH"
    end

    it "places and turns left" do
      simulator = Simulator.new
      simulator.perform_action("PLACE 0,0,NORTH\n")
      simulator.perform_action("LEFT\n")
      result = simulator.perform_action("REPORT\n")
      expect(result).to eq "0,0,WEST"
    end

    it "performs a sequence of instructions" do
      simulator = Simulator.new
      simulator.perform_action("PLACE 1,2,EAST\n")
      simulator.perform_action("MOVE\n")
      simulator.perform_action("MOVE\n")
      simulator.perform_action("LEFT\n")
      simulator.perform_action("MOVE\n")
      result = simulator.perform_action("REPORT\n")
      expect(result).to eq "3,3,NORTH"
    end

    it "does not report if the robot has not been placed yet" do
      simulator = Simulator.new
      result = simulator.perform_action("REPORT\n")
      expect(result).to be_nil
    end
  end
end

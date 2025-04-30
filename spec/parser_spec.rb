require "./src/parser"

describe "Parser" do
  it "returns nil for an unknown command" do
    expect(Parser.parse("unknown")).to be_nil
  end

  it "parses a left command" do
    expect(Parser.parse("LEFT")).to eq [ :left ]
  end

  it "parses a right command" do
    expect(Parser.parse("RIGHT")).to eq [ :right ]
  end

  it "parses a move command" do
    expect(Parser.parse("MOVE")).to eq [ :move ]
  end

  it "parses a report command" do
    expect(Parser.parse("REPORT")).to eq [ :report ]
  end

  VALID_DIRECTIONS = [ :north, :south, :east, :west]

  VALID_DIRECTIONS.each do |direction|
    it "parses a #{direction}-facing place command" do
      expect(Parser.parse("PLACE 1,2,#{direction.upcase}")).to eq [ :place, { x: 1, y: 2, facing: direction } ]
    end
  end

  describe "place command errors" do
    it "returns nil for an invalid facing direction" do
      expect(Parser.parse("PLACE 3,4,INVALID")).to be_nil
    end

    it "returns nil if the position is off the north boundary" do
      expect(Parser.parse("PLACE 3,5,NORTH")).to be_nil
    end

    it "returns nil if the position is off the south boundary" do
      expect(Parser.parse("PLACE 3,-1,NORTH")).to be_nil
    end

    it "returns nil if the position is off the west boundary" do
      expect(Parser.parse("PLACE -1,4,NORTH")).to be_nil
    end

    it "returns nil if the position is off the east boundary" do
      expect(Parser.parse("PLACE 5,4,NORTH")).to be_nil
    end

    it "returns nil for wrong number of arguments" do
      expect(Parser.parse("PLACE")).to be_nil
    end

    it "returns nil for non-numeric x value" do
      expect(Parser.parse("PLACE THREE,4,NORTH")).to be_nil
    end

    it "returns nil for non-integer x value" do
      expect(Parser.parse("PLACE 3.2,4,NORTH")).to be_nil
    end

    it "returns nil for non-numeric y value" do
      expect(Parser.parse("PLACE 3,FOUR,NORTH")).to be_nil
    end

    it "returns nil for non-integer y value" do
      expect(Parser.parse("PLACE 3,4.2,NORTH")).to be_nil
    end
  end
end

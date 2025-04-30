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

  it "parses a north-facing place command" do
    expect(Parser.parse("PLACE 1 2 NORTH")).to eq [ :place, { x: 1, y: 2, facing: :north } ]
  end

  it "parses an east-facing place command" do
    expect(Parser.parse("PLACE 3 4 EAST")).to eq [ :place, { x: 3, y: 4, facing: :east } ]
  end
end

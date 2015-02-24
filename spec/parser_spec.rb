require 'parslet/rig/rspec'
RSpec.describe Doublesing::Parser do
  let(:parser){Doublesing::Parser.new}
  context "block_start" do
    it "should consume properly" do
      expect(parser.block_start).to parse("\\")

    end
    it "should not consume escaped input" do
      expect(parser.block_start).to_not parse("\\\\")
    end
  end
  context "block_id" do
    it "parses letter names" do
      expect(parser.block_id).to parse("bold")
    end
    it "parses letter names with underscores" do
      expect(parser.block_id).to parse("link_to")
    end
    it "doesn't parse things with spaces" do
      expect(parser.block_id).to_not parse("this thing")
    end
    it "doesn't parse blank things" do
      expect(parser.block_id).to_not parse("")
    end
    it "parses single letters" do
      expect(parser.block_id).to parse("a")
    end
  end
  context "text" do
    it "parses plaintext" do
      expect(parser.text).to parse("can you go man?")
    end
    it "parses escaped backslashes" do
      expect(parser.text).to parse("\\\\dude")
    end
    it "doesn't parse block starts" do
      expect(parser.text).to_not parse("\\block{this}")
    end
  end
  context "block" do
    it "parses blocks with arity of 1" do
      expect(parser.block).to parse("\\block{test}")
    end
    it "parses block with arity of 2" do
      expect(parser.block).to parse("\\block{test}{other}")
    end
  end
end

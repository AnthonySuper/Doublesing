require 'parslet/rig/rspec'
RSpec.describe Doublesing::Parser do
  let(:p){Doublesing::Parser.new}
  context "argument_begin" do
    it "matches [" do
      expect(p.argument_begin).to parse("[")
    end
  end
  context "argument_end" do
    it "matches ]" do
      expect(p.argument_end).to parse("]")
    end
    it "doesn't match \\]" do
      expect(p.argument_end).to_not parse("\\]")
    end
  end
  context "block_begin" do
    it "makes \\" do
      expect(p.block_begin).to parse("\\")
    end
    it "ignores \\\\" do
      expect(p.block_begin).to_not parse("\\\\")
    end
  end
  context "block_id" do
    it "matches underscore_names" do
      expect(p.block_id).to parse("underscore_names")
    end
    it "matches CapitalNames" do
      expect(p.block_id).to parse("CapitalNames")
    end
    it "doesn't match an empty string" do
      expect(p.block_id).to_not parse("")
    end
  end
  context "block_header" do
    it "matches a valid header" do
      expect(p.block_header).to parse("\\begin")
    end
  end
  context "text" do
    it "doesn't match a block_header" do
      expect(p.text).to_not parse("\\begin")
    end
    it "does match other text" do
      expect(p.text).to parse("other text")
    end
    it "doesn't match an argument_end" do
      expect(p.text).to_not parse("end]")
    end
  end
  context "block" do
    it "matches a properly formed block" do
      expect(p.block).to parse("\\test[arg]")
    end
    it "matches blocks of any arity" do
      expect(p.block).to parse("\\test[arg1][arg2]")
    end
  end
end


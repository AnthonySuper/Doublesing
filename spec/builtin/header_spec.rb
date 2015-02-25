require 'spec_helper'

RSpec.describe Doublesing::Builtins::Header do
  let(:h){Doublesing::Builtins::Header}
  it "parses headers with with whatever level" do
    expect(h.new(["2", "test"]).to_s)
      .to eq("<h2>test</h2>")

  end
  it "uses h1 as the default" do
    expect(h.new(["not number", "test"]).to_s)
      .to eq("<h1>test</h1>")
  end
end

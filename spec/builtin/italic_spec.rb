require 'spec_helper'

RSpec.describe Doublesing::Builtins::Italic do
  let(:i){Doublesing::Builtins::Italic}
  it "wraps text in italic tags" do
    expect(i.new(["test"]).to_s).to eq("<i>test</i>")
  end
  it "ignores other arguments" do
    expect(i.new(["test", "other"]).to_s).to eq("<i>test</i>")
  end
end

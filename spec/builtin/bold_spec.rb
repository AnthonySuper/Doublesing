require 'spec_helper'

RSpec.describe Doublesing::Builtins::Bold do
  let(:b){Doublesing::Builtins::Bold}
  it "makes bold text" do
    expect(b.new(["bold me"]).to_s).to eq("<b>bold me</b>")
  end
  it "ignores arguments after the first" do
    expect(b.new(["bold", "me"]).to_s).to eq("<b>bold</b>")
  end
end

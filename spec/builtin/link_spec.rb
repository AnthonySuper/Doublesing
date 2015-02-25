require 'spec_helper'

RSpec.describe Doublesing::Builtins::Link do
  let(:l){Doublesing::Builtins::Link}
  it "matches a properly formed link" do
    expect(l.new(["http://www.example.com", "example"]).to_s)
      .to eq("<a href=\"http://www.example.com\">example</a>")

  end
  it "doesn't match evil links" do
    expect(l.new(["javascript:evil()", "example"]).to_s)
      .to eq("example")
  end

end

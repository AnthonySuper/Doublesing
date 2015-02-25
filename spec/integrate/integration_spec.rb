require 'spec_helper'

RSpec.describe "integrated tests" do
  ##
  # This method basically checks a whole bunch of .2sing files to make
  # sure they match the .html files they're associated with.
  it "passes" do
    Doublesing.setup!
    before = Dir[File.dirname(__FILE__) + "/before/*.2sing"].sort
    after = Dir[File.dirname(__FILE__) + "/after/*.html"].sort
    before_content = before.map{|path| File.open(path).read}
    after_content = after.map{|path| File.open(path).read}
    ##
    # Create [before, after] pairs
    before_content.zip(after_content).each_with_index do |t, i|
      expect(Doublesing.parse(t.first))
        .to eq(t.last), "#{before[i]} did not become #{after[i]}!"
    end
  end
end

require 'parslet'
module Doublesing
  class Parser < Parslet::Parser
    rule(:text) { ((str("\\\\") ) | (block_start.absent? >> str("{").absent? >>  any)).repeat}
    rule(:block_id) {match["\\w"].repeat(1)}
    rule(:block_start){ str("\\\\").absent? >> str("\\") }
    rule(:block){ block_start >> block_id >> (str("{") >> expr >> str("}")).repeat(1,2)}
    rule(:expr){text | block}
  end
end

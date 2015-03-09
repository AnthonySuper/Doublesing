require 'parslet'
module Doublesing
  class Parser < Parslet::Parser
    rule(:argument_begin){ str("[") }
    rule(:argument_end){ str("\\]").absent? >> str("]")}
    rule(:block_begin){ str("\\\\").absent? >> str("\\")}
    rule(:block_id){ match["\\w"].repeat(1)}
    rule(:block_header){ block_begin >> block_id.as(:id)}
    rule(:text){ (block_header.absent? >> argument_end.absent? >> any).repeat(1).as(:text)}
    rule(:block){ block_header >> (argument_begin >> body.as(:body) >> argument_end).repeat.as(:argument)}
    rule(:expr) {text | block}
    rule(:body) {expr.repeat(1)}
    rule(:document){expr.repeat(1)}
    root(:document)
  end
end

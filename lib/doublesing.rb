require "doublesing/version"
require "doublesing/parser"
require "doublesing/transformer"
require "doublesing/builtins"
require "sanitize"

##
# The Doublesing module is the main interface for interacting with Doublesing
module Doublesing
  ##
  # This method takes a string of source in the Doublesing language, and returns the resulting HTML
  # It will sanitize any HTML fragments out of the source first, for safety's sake.
  def self.parse(str)
    sanitized = Sanitize.fragment(str)
    tree = Parser.new.parse(sanitized)
    res = Transformer.new.apply(tree)
    res.join("")
  end
  ##
  # Assign a handler for a custom block class.
  # +name+: Name the block should respond to
  # +klass+: class the block should be generated from
  # Note: 
  def self.assign(name, klass)
    @@handlers[name] = klass
  end
  ##
  # Load default block handlers
  # YOU MUST CALL THIS BEFORE ANYTHING ELSE
  def self.setup!
    @@handlers = {}
    @@handlers.merge! Builtins.handlers
  end

  protected
  ##
  # Take the id of a block and its arguments and process it, returning html.
  def self.process(id, args)
    if handler = @@handlers[id.to_s]
      handler.new(args).to_s
    else
      ""
    end
  end

end

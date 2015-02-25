require "doublesing/version"
require "doublesing/parser"
require "doublesing/transformer"
require "doublesing/builtins"
require "sanitize"

require "pp"
module Doublesing
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

  def self.process(id, args)
    if handler = @@handlers[id.to_s]
      handler.new(args).to_s
    else
      ""
    end
  end
  def self.setup!
    @@handlers = {}
    @@handlers.merge! Builtins.handlers
  end
end

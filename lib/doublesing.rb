require "doublesing/version"
require "doublesing/parser"
require "doublesing/transformer"
require "doublesing/builtins"
require "pp"
module Doublesing
  def self.parse(str)
    tree = Parser.new.parse(str)
    pp tree
    res = Transformer.new.apply(tree)
    res
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

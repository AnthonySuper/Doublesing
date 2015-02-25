module Doublesing
  module Builtins
    class Bold
      def initialize(args)
        puts "arg is #{args.inspect}"
        puts "first is #{args.first.inspect}"
        @args = args
      end

      def to_s
        "<b>#{@args.first}</b>"
      end
    end
  end
end


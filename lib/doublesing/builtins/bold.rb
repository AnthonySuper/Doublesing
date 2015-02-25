module Doublesing
  module Builtins
    class Bold
      def initialize(args)
        @args = args
      end

      def to_s
        "<b>#{@args.first}</b>"
      end
    end
  end
end


module Doublesing
  module Builtins
    class Italic
      def initialize(arg)
        @arg = arg
      end
      def to_s
        "<i>#{@arg.first.to_s}</i>"
      end
    end
  end
end


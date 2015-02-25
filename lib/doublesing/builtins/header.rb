module Doublesing
  module Builtins
    class Header
      def initialize(a)
        @level = a[0].to_i
        @body = a[1].to_s
      end
      def to_s
        if @level && @level > 0
          "<h#{@level}>#{@body}</h#{@level}>"
        else
          "<h1>#{@body}</h1>"
        end
      end
    end
  end
end


require 'uri'
module Doublesing
  module Builtins
    class Link
      def initialize(args)
        @url = args.first.to_s
        @body = args.last.to_s
      end

      def to_s
        if @url =~ URI::regexp
          "<a href=\"#{@url}\">#{@body}</a>"
        else
          @body
        end
      end
    end
  end
end


require_relative './builtins/bold'

module Doublesing
  module Builtins
    def self.handlers
      {"bold" => Bold}
    end
  end
end

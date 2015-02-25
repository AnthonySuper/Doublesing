Dir[File.dirname(__FILE__) + "/builtins/*.rb"].each{|file| require file}
module Doublesing
  module Builtins
    def self.handlers
      {"bold" => Bold,
       "italic" => Italic,
       "link" => Link}

    end
  end
end

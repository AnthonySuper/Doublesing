require 'parslet'
module Doublesing
  class Transformer < Parslet::Transform
    rule(text: simple(:text)){text}
    rule(body: sequence(:body)){body.join("")}
    rule(id: simple(:id), 
         argument: sequence(:argument)){Doublesing.process(id, argument)}
  end
end


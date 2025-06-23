module Keisan
  module Parsing
    class Factorial < Component
      def node_class
        AST::Factorial
      end
    end
  end
end

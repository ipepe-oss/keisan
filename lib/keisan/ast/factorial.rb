module Keisan
  module AST
    class Factorial < UnaryOperator
      def value(context = nil)
        n = child.value(context)
        (1..n).inject(1) { |res, i| res * i }
      end

      def evaluate(context = nil)
        context ||= Context.new
        node = child.evaluate(context).to_node
        if node.is_a?(Number)
          Number.new((1..node.value(context)).inject(1) { |res, i| res * i })
        else
          self.class.new(node)
        end
      end

      def simplify(context = nil)
        context ||= Context.new
        node = child.simplify(context).to_node
        if node.is_a?(Number)
          Number.new((1..node.value(context)).inject(1) { |res, i| res * i })
        else
          self.class.new(node)
        end
      end

      def to_s
        "#{child.to_s}!"
      end

      def self.symbol
        :"!"
      end

      def self.arity
        ARITIES[:"!"]
      end

      def self.priority
        PRIORITIES[:"!"]
      end

      def self.associativity
        ASSOCIATIVITIES[:"!"]
      end
    end
  end
end

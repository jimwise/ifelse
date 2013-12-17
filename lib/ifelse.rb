module IfElse
  VERSION = '0.6.0'

  module TrueIfBehavior
    def if
      raise "Syntax Error: if without block" unless block_given?
      yield self
    end

    def unless
      raise "Syntax Error: unless without block" unless block_given?
      false
    end
  end

  module FalseIfBehavior
    def if
      raise "Syntax Error: if without block" unless block_given?
      self
    end

    def unless
      raise "Syntax Error: unless without block" unless block_given?
      yield self
    end
  end
end


class Object
  include IfElse::TrueIfBehavior
end

class FalseClass
  include IfElse::FalseIfBehavior
end

class NilClass
  include IfElse::FalseIfBehavior
end

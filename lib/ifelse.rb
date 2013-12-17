module IfElse
  VERSION = '0.6.0'
end

# XXX all of these should verify that block_given? or error...

module TrueIfBehavior
 def if
   raise "Syntax Error: if without block" unless block_given?
   yield
 end

 def else
   raise "Syntax Error: else without block" unless block_given?
   self
 end
end

module FalseIfBehavior
 def if
   raise "Syntax Error: if without block" unless block_given?
   self
 end

 def else
   raise "Syntax Error: else without block" unless block_given?
   yield
 end
end

class Object
 include TrueIfBehavior
end

class FalseClass
 include FalseIfBehavior
end

class NilClass
 include FalseIfBehavior
end

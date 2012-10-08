require 'typedocs'

class A
  include Typedocs::DSL

  tdoc "Numeric -> Numeric"
  def square x
    x * x
  end
end
